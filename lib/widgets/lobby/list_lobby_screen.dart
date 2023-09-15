import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:runfinity/utils/api_services.dart';
import 'package:runfinity/widgets/lobby/single_lobby_screen.dart';

import '../../models/lobby_model.dart';

class ListLobbyScreen extends StatefulWidget {
  const ListLobbyScreen({super.key});

  @override
  State<ListLobbyScreen> createState() => _ListLobbyScreenState();
}

class _ListLobbyScreenState extends State<ListLobbyScreen> {

  Future<List<Lobby>> fetchListLobby() async {
    final res = await APIServices.getDataAPI("lobby/");
    if (res.statusCode == 200) {
      List jsonRes = json.decode(res.body);
      return jsonRes.map((data) => Lobby.fromJson(data)).toList();
    }
    else {
      throw jsonDecode(res.body)["msg"] ?? "Unknown Error Occured";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchListLobby();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder<List<Lobby>>(
        future: fetchListLobby(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Lobby>? lobbyList = snapshot.data;
            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lobbyList?.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleLobbyScreen(
                        id: lobbyList![index].id,
                        targetLocationLat: lobbyList![index].targetLocationLat.toString(),
                        targetLocationLong: lobbyList![index].targetLocationLong.toString(),
                        limitedMembers: lobbyList![index].limitMembers,
                        currentMembers: lobbyList![index].currentMembers,
                        createdAt: lobbyList![index].createdAt,
                        name: lobbyList![index].name
                      ),
                      const SizedBox(width: 20,),
                    ],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Text("Data error");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      onRefresh: () {
        setState(() {
        });
        return fetchListLobby();
      },
    );
  }
}
