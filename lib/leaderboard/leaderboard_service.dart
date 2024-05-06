import 'package:club_plus/models/activity.dart';
import 'package:club_plus/models/user.dart';

import '../models/challenge.dart';

class LeaderboardService {
  final List<User> _users = [
    User(
      userId: '1',
      firstName: 'John',
      lastName: 'Doe',
      profilePicUrl: 'https://example.com/john.jpg',
      activities: [
        Activity(
          distance: 10.0,
          sportType: 'running',
          startDateLocal: DateTime.now(),
        ),
        Activity(
          distance: 5.0,
          sportType: 'cycling',
          startDateLocal: DateTime.now(),
        ),
      ],
    ),
    User(
      userId: '2',
      firstName: 'Jane',
      lastName: 'Smith',
      profilePicUrl: 'https://example.com/jane.jpg',
      activities: [
        Activity(
          distance: 8.0,
          sportType: 'running',
          startDateLocal: DateTime.now(),
        ),
        Activity(
          distance: 12.0,
          sportType: 'cycling',
          startDateLocal: DateTime.now(),
        ),
      ],
    ),
    // Add more dummy user data
  ];

  List<User> get users => _users;

  List<LeaderboardEntry> getLeaderboardEntries(
      User currentUser, Challenge challenge) {
    // Calculate leaderboard entries based on user activities and challenge criteria
    List<LeaderboardEntry> leaderboardEntries = [];

    // Calculate the current user's total distance and add them to the leaderboard entries
    final currentUserActivities = currentUser.activities ?? [];
    final currentUserTotalDistance =
        _calculateTotalDistance(currentUserActivities, challenge);
    leaderboardEntries.add(
      LeaderboardEntry(
        name: '${currentUser.firstName} ${currentUser.lastName}',
        avatarUrl: currentUser.profilePicUrl,
        progress: currentUserTotalDistance / challenge.target,
      ),
    );

    // Calculate and add other users' leaderboard entries
    for (final user in _users) {
      final userActivities = user.activities ?? [];
      final totalDistance = _calculateTotalDistance(userActivities, challenge);
      leaderboardEntries.add(
        LeaderboardEntry(
          name: '${user.firstName} ${user.lastName}',
          avatarUrl: user.profilePicUrl,
          progress: totalDistance / challenge.target,
        ),
      );
    }

    // Sort leaderboard entries by progress in descending order
    leaderboardEntries.sort((a, b) => b.progress.compareTo(a.progress));

    return leaderboardEntries;
  }

  double _calculateTotalDistance(
      List<Activity> activities, Challenge challenge) {
    // Filter activities based on challenge criteria (e.g., sport type, date range)
    final filteredActivities = activities.where((activity) {
      // Filter by activity type
      return activity.sportType.toLowerCase() == challenge.activityType.name;
      // Add additional filters if needed (e.g., date range)
    }).toList();

    // Calculate total distance based on filtered activities
    return filteredActivities.fold<double>(
        0, (sum, activity) => sum + activity.distance);
  }
}

class LeaderboardEntry {
  final String name;
  final String avatarUrl;
  final double progress;

  LeaderboardEntry({
    required this.name,
    required this.avatarUrl,
    required this.progress,
  });
}
