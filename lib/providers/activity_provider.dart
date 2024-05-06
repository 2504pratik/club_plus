import 'package:flutter/material.dart';

import '../models/activity.dart';

class ActivityProvider extends ChangeNotifier {
  List<Activity> _activities = [];

  List<Activity> get activities => _activities;

  void setActivities(List<Activity> activities) {
    _activities = activities;
    notifyListeners();
  }
}
