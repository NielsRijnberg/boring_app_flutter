import 'package:boring_app/models/activity.dart';
import 'package:boring_app/widgets/activity_information_row.dart';
import 'package:flutter/material.dart';

class FavoriteActivityItem extends StatefulWidget {
  
  final Activity favoriteActivity;
  FavoriteActivityItem({Key key, @required this.favoriteActivity}) : super(key: key);

  @override
  _FavoriteActivityItemState createState() => _FavoriteActivityItemState();
}

class _FavoriteActivityItemState extends State<FavoriteActivityItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        Container(
          // height: 150.0,
          width: MediaQuery.of(context).size.width - 30,
          margin: EdgeInsets.only(top: 30.0, right: 30),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityInformationRow(activity: widget.favoriteActivity, isLiked: true),
              SizedBox(height: 10),
              Text(
                widget.favoriteActivity.activity,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.accessibility,
                        color: Color(0xffec5ba6),
                      ),
                      Text(
                        widget.favoriteActivity.getAccessibilityRating().toInt().toString(), 
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.euro,
                        color: Color(0xffec5ba6),
                      ),
                      Text(
                        widget.favoriteActivity.getPriceRating().toInt().toString(), 
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}