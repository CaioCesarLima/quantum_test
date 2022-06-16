import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantum_app/src/core/controllers/user_controller.dart';
import 'package:quantum_app/src/data/models/music_model.dart';

import '../home/home_controller.dart';

class PlaylistPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Playlist'),
          centerTitle: true,
        ),
        body: GetBuilder<UserController>(
          init: Get.find<UserController>(),
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: _.loggedUser!.musics.length,
                      itemBuilder: (context, index) {
                        MusicModel music = _.loggedUser!.musics[index];
                        return tileMusic(music);
                      }),
                ),
                if (_.loggedUser!.musics.length >=
                    _.loggedUser!.plan.limit) ...[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text("Limite de seu plano alcançado"),
                  )
                ],
              ],
            );
          },
        ));
  }
}

Widget tileMusic(MusicModel music) {
  HomeController homeController = Get.find<HomeController>();
  return GetBuilder<UserController>(
      init: Get.find<UserController>(),
      builder: (_) {
        print("recebeu o update");
        print(_.contains(music));
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                music.name,
                style: const TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    music.plan.name,
                    style: const TextStyle(fontSize: 12, color: Colors.amber),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  _.contains(music) != null
                      ? TextButton(
                          onPressed: () {
                            homeController.remove_playlist(music);
                          },
                          child: const Text("Remover"))
                      : Container()
                ],
              )
            ],
          ),
        );
      });
}
