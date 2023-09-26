class LobbyModel {
  final int id;
  final double targetLocationLat;
  final double targetLocationLong;
  final int limitMembers;
  final int currentMembers;
  final String createdAt;
  final String name;

  LobbyModel({
    required this.id,
    required this.targetLocationLat,
    required this.targetLocationLong,
    required this.limitMembers,
    required this.currentMembers,
    required this.createdAt,
    required this.name,
  });

  factory LobbyModel.fromJson(Map<String, dynamic> json) {
    return LobbyModel(
      id: json['id'],
      targetLocationLat: json['targetLocationLat'],
      targetLocationLong: json['targetLocationLong'],
      createdAt: json['createdAt'],
      limitMembers: json['limitMembers'],
      currentMembers: json['currentMembers'],
      name: json['name'],
    );
  }
}