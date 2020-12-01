import 'package:boring_app/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingBar extends StatefulWidget {
  final double rating;
  MyRatingBar({Key key, @required this.rating}) : super(key: key);

  @override
  _MyRatingBarState createState() => _MyRatingBarState();
}

class _MyRatingBarState extends State<MyRatingBar> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: widget.rating,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Color(0xffec5ba6),
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      );
  }
}
