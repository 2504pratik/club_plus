import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/activity_provider.dart';
import '../models/activity.dart';

class UserActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Activities'),
      ),
      body: Consumer<ActivityProvider>(
        builder: (context, activityProvider, _) {
          final activities = activityProvider.activities;

          if (activities.isEmpty) {
            // Activities are not loaded yet, show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Activities are loaded, display them in a ListView
            return ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ActivityTile(activity: activity);
              },
            );
          }
        },
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final Activity activity;

  const ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${activity.sportType.toUpperCase()} ACTIVITY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 8),
                Text(
                    DateFormat('MMM dd, yyyy').format(activity.startDateLocal)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 8),
                Text('${activity.distance.toStringAsFixed(2)} km'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
