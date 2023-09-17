class UserModel {
  late int id;
  String? username;
  int? level;
  int? currentExp;
  int? levelUpExp;
  int? totalSteps;
  int? earnedPts;
  String? fullname;
  String? refresh;
  String? access;

  UserModel(
      {required this.id,
      this.username,
      this.level,
      this.currentExp,
      this.levelUpExp,
      this.totalSteps,
      this.earnedPts,
      this.fullname,
      this.refresh,
      this.access});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    level = json['level'];
    currentExp = json['currentExp'];
    levelUpExp = json['levelUpExp'];
    totalSteps = json['totalSteps'];
    earnedPts = json['earnedPts'];
    fullname = json['fullname'];
    refresh = json['refresh'];  
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['level'] = level;
    data['currentExp'] = currentExp;
    data['levelUpExp'] = levelUpExp;
    data['totalSteps'] = totalSteps;
    data['earnedPts'] = earnedPts;
    data['fullname'] = fullname;
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
