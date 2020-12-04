import 'dart:convert';

import 'package:boring_app/models/activity.dart';
import 'package:http/http.dart' as http;

Future<Activity> fetchRandomActivity() async {
  final response = await http.get('https://www.boredapi.com/api/activity/');

  if (response.statusCode == 200) {
    return Activity.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load activity');
  }
}

Future<Activity> fetchRandomActivityByType(String type) async {
  final response = await http.get('https://www.boredapi.com/api/activity?type=' + type);

  if (response.statusCode == 200) {
    return Activity.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load activity');
  }
}