import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantum_app/src/core/controllers/user_controller.dart';
import 'package:quantum_app/src/modules/home/home_controller.dart';
import 'package:quantum_app/src/routes/app_routes.dart';

import '../../data/models/music_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Musicas"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(Routes.INITIAL);
          }, icon: const Icon(Icons.music_note))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GetX<HomeController>(
          init: Get.find<HomeController>(),
          initState: (_) {},
          builder: (_) {
            return controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _.musicList.length,
                    itemBuilder: ((context, index) {
                      MusicModel music = _.musicList[index];
                      return tileMusic(music);
                    }));
          },
        ),
      ),
    );
  }
}

Widget tileMusic(MusicModel music) {
  HomeController homeController = Get.find<HomeController>();
  return GetBuilder<UserController>(
    init: Get.find<UserController>(),
    builder: (_){
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
                _.loggedUser!.musics.length <
                        _.loggedUser!.plan.limit
                    ? _.contains(music) == null
                        ? TextButton(
                            onPressed: () {
                              homeController.add_playlist(music);
                            },
                            child: const Text("Adicionar"))
                        : TextButton(
                            onPressed: () {
                               homeController.remove_playlist(music);
                            },
                            child: const Text("Remover"))
                    : TextButton(
                        onPressed: () {},
                        child: const Text("Limite ultrapassado"))
              ],
            )
          ],
        ),
      );
  });
      
}
