import 'package:boring_app/models/activity.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TypeDropDownSearch extends StatefulWidget {
  String type;

  TypeDropDownSearch({Key key, @required this.type}) : super(key: key);

  @override
  _TypeDropDownSearchState createState() => _TypeDropDownSearchState();
}

class _TypeDropDownSearchState extends State<TypeDropDownSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            print(value);
            widget.type = value;
          });
        },
      ),
    );
  }
}
