import 'package:boring_app/models/activity.dart';
import 'package:boring_app/widgets/type_activity_container.dart';
import 'package:boring_app/widgets/type_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class FindActivityScreen extends StatefulWidget {
  @override
  _FindActivityScreenState createState() => _FindActivityScreenState();
}

class _FindActivityScreenState extends State<FindActivityScreen> {
  String type;

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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: types,
                  label: "Choose type of activity",
                  hint: "",
                  onChanged: (value) {
                    setState(() {
                      type = value;
                      print(type);
                    });
                  },
                ),
              ),
            ),
            
            TypeActivityContainer(type: type)
          ],
        ),
      ),
    );
  }
}
