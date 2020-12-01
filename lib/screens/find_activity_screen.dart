import 'package:flutter/material.dart';

class FindActivityScreen extends StatefulWidget {
  @override
  _FindActivityScreenState createState() => _FindActivityScreenState();
}

class _FindActivityScreenState extends State<FindActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Find activity',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(

      ),
    );
  }
}