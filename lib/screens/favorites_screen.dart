import 'package:boring_app/models/activity.dart';
import 'package:boring_app/widgets/favorite_activity_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Favorite activities',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )
        ),
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            return FavoriteActivityItem(favoriteActivity: favorites[index]);
          }
        ),
      ),
    );
  }
}