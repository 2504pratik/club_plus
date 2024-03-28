class Club {
  late int clubId;
  late String clubName;
  late int adminId;
  late bool isVerified = false;

  // Getters
  int get getClubId => clubId;

  String get getClubName => clubName;

  int get getAdminId => adminId;

  bool get getIsVerified => isVerified;

  // Setters
  set setClubId(int value) {
    clubId = value;
  }

  set setClubName(String value) {
    clubName = value;
  }

  set setAdminId(int value) {
    adminId = value;
  }

  set setIsVerified(bool value) {
    isVerified = value;
  }

  Club(int clubId, String clubName, int adminId, bool isVerified) {
    this.clubId = clubId;
    this.clubName = clubName;
    this.adminId = adminId;
    this.isVerified = isVerified;
  }
}