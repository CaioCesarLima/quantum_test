

import 'package:get/get.dart';
import 'package:quantum_app/src/core/controllers/user_controller.dart';

import '../../data/models/music_model.dart';
import '../../data/repository/music_repository.dart';

class HomeController extends GetxController  {

  final MusicRepository repository;
  UserController userController = Get.find<UserController>();

  HomeController(this.repository);

  RxList<dynamic> musicList = [].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    print('controller');
    fetch_music();
  }

  void fetch_music() async{
    loading.value = true;
    
    musicList.value = await repository.getMusics(1);
    loading.value = false;
    
  }

  void add_playlist(MusicModel music) async{
    
     await repository.add_playlist(music.id,  userController.loggedUser!.id);
     userController.add_music(music);
  }

  void remove_playlist(MusicModel music) async{
    
     await repository.remove_playlist(music.id,  userController.loggedUser!.id);
     userController.remove_music(music);
  }
}