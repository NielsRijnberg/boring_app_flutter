import 'package:boring_app/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityInformationRow extends StatefulWidget {
  final Activity activity;
  bool isLiked;
  ActivityInformationRow(
      {Key key, @required this.activity, @required this.isLiked})
      : super(key: key);

  @override
  _ActivityInformationRowState createState() => _ActivityInformationRowState();
}

class _ActivityInformationRowState extends State<ActivityInformationRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.people,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(width: 10),
            Text(
              widget.activity.participants.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
        Text(
          widget.activity.type.toUpperCase(),
          style: Theme.of(context).textTheme.headline2,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.isLiked) {
                widget.isLiked = false;
                favorites.remove(widget.activity);
              } else {
                widget.isLiked = true;
                favorites.add(widget.activity);
              }
            });
          },
          child: Icon(
            widget.isLiked ? Icons.favorite : Icons.favorite_border,
            color: Color(0xffec5ba6),
            size: 35.0,
          ),
        ),
      ],
    );
  }
}
