import 'package:runfinity/models/user_model.dart';

class LobbyChatMesagesModel {
  final int id;
  final String content;
  final UserModel user; //just for test, will be type UserModel when done api fetching user
  final String createdAt; //change this to current time 

  LobbyChatMesagesModel({required this.id, required this.content, required this.user, required this.createdAt});
}
