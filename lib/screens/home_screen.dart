import 'package:boring_app/models/activity.dart';
import 'package:boring_app/screens/favorites_screen.dart';
import 'package:boring_app/screens/find_activity_screen.dart';
import 'package:boring_app/services/activity_service.dart';
import 'package:boring_app/widgets/activity_information_row.dart';
import 'package:boring_app/widgets/gradient_button.dart';
import 'package:boring_app/widgets/item_devider.dart';
import 'package:boring_app/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Activities to do',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
              ),
              child: Center(
                child: FutureBuilder<Activity>(
                  future: futureActivity,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width - 60.0,
                            margin: EdgeInsets.only(top: 50.0),
                            child: Text(snapshot.data.activity,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            height: MediaQuery.of(context).size.height - 400.0,
                            margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                )),
                            child: Column(
                              children: [
                                ItemDevider(),
                                ActivityInformationRow(activity: snapshot.data, isLiked: isLiked),
                                ItemDevider(),
                                ItemDevider(),
                                Text('Accessibility',
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                MyRatingBar(
                                  rating: snapshot.data.getAccessibilityRating(),
                                  isPrice: false,
                                ),
                                ItemDevider(),
                                Text(
                                  'Price',
                                  style: Theme.of(context).textTheme.headline1
                                ),
                                MyRatingBar(
                                  rating: snapshot.data.getPriceRating(),
                                  isPrice: true,
                                ),
                                ItemDevider(),
                                GradientButton(
                                  onPressed: () {
                                    setState(() {
                                      futureActivity = fetchRandomActivity();
                                      isLiked = false;
                                    });
                                  },
                                  title: 'Other activity',
                                  fromColor: Color(0xfff05fa0),
                                  toColor: Color(0xfffeb342),
                                ),
                                ItemDevider(),
                                GradientButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => FindActivityScreen()),
                                    );
                                  },
                                  title: 'Find an activity',
                                  fromColor: Color(0xff7e0dfd),
                                  toColor: Color(0xffec5ba6),
                                )
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
