import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingBar extends StatefulWidget {
  final double rating;
  final bool isPrice;
  MyRatingBar({Key key, @required this.rating, @required this.isPrice}) : super(key: key);

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
        widget.isPrice ? Icons.euro : Icons.accessibility,
        color: Color(0xffec5ba6),
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
