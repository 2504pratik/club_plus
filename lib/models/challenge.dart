enum ActivityType { running, swimming, cycling, hiking }

class Challenge {
  late int challengeId;
  late String challengeTitle;
  late DateTime startDate;
  late DateTime startTime;
  late DateTime endDate;
  late DateTime endTime;
  late ActivityType activityType;
  late String desc;
  late bool completed = false;

  // Getters
  int get getChallengeId => challengeId;

  String get getChallengeTitle => challengeTitle;

  DateTime get getStartDate => startDate;

  DateTime get getStartTime => startTime;

  DateTime get getEndDate => endDate;

  DateTime get getEndTime => endTime;

  ActivityType get getActivityType => activityType;

  String get getDesc => desc;

  bool get getCompleted => completed;

  // Setters
  set setChallengeId(int value) {
    challengeId = value;
  }

  set setChallengeTitle(String value) {
    challengeTitle = value;
  }

  set setStartDate(DateTime value) {
    startDate = value;
  }

  set setStartTime(DateTime value) {
    startTime = value;
  }

  set setEndDate(DateTime value) {
    endDate = value;
  }

  set setEndTime(DateTime value) {
    endTime = value;
  }

  set setActivityType(ActivityType value) {
    activityType = value;
  }

  set setDesc(String value) {
    desc = value;
  }

  set setCompleted(bool value) {
    completed = value;
  }

  // Constructors
  Challenge(
      int challengeId,
      String challengeTitle,
      DateTime startDate,
      DateTime startTime,
      DateTime endDate,
      DateTime endTime,
      ActivityType activityType,
      String desc,
      bool completed) {
    this.challengeId = challengeId;
    this.challengeTitle = challengeTitle;
    this.startDate = startDate;
    this.startTime = startTime;
    this.endDate = endDate;
    this.endTime = endTime;
    this.activityType = activityType;
    this.desc = desc;
    this.completed = completed;
  }
}