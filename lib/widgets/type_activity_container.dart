import 'package:boring_app/models/activity.dart';
import 'package:boring_app/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'activity_information_row.dart';
import 'gradient_button.dart';
import 'item_devider.dart';
import 'rating_bar.dart';

class TypeActivityContainer extends StatefulWidget {
  final String type;

  TypeActivityContainer({Key key, @required this.type}) : super(key: key);

  @override
  _TypeActivityContainerState createState() => _TypeActivityContainerState();
}

class _TypeActivityContainerState extends State<TypeActivityContainer> {
  Future<Activity> futureActivity;
  bool isLiked = false;

  @protected
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureActivity = fetchRandomActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Activity>(
        future: futureActivity,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width - 60.0,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(snapshot.data.activity,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60.0,
                  height: MediaQuery.of(context).size.height - 500.0,
                  margin: EdgeInsets.only(bottom: 30.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      )),
                  child: Column(
                    children: [
                      ItemDevider(),
                      ActivityInformationRow(
                          activity: snapshot.data, isLiked: isLiked),
                      ItemDevider(),
                      ItemDevider(),
                      Text('Accessibility',
                          style: Theme.of(context).textTheme.headline1),
                      MyRatingBar(
                        rating: snapshot.data.getAccessibilityRating(),
                        isPrice: false,
                      ),
                      ItemDevider(),
                      Text('Price',
                          style: Theme.of(context).textTheme.headline1),
                      MyRatingBar(
                        rating: snapshot.data.getPriceRating(),
                        isPrice: true,
                      ),
                      ItemDevider(),
                      GradientButton(
                        onPressed: () {
                          setState(() {
                            futureActivity = fetchRandomActivityByType(widget.type);
                            isLiked = false;
                          });
                        },
                        title: 'Other activity',
                        fromColor: Color(0xfff05fa0),
                        toColor: Color(0xfffeb342),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
