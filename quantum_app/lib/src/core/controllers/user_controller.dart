import 'package:get/get.dart';
import 'package:quantum_app/src/data/models/music_model.dart';
import 'package:quantum_app/src/data/models/user_model.dart';
import 'package:quantum_app/src/data/repository/user_repository.dart';

class UserController extends GetxController {
  final UserRepository repository = UserRepository();

UserController();

  UserModel? loggedUser;
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    loggedUser = await repository.getUser(1);
  }

  dynamic contains(music){
   return loggedUser!.musics
      .firstWhereOrNull((itemToCheck) => itemToCheck.id == music.id);
  }

  void add_music(MusicModel music){
    loggedUser!.musics.add(music);
    update();
  }

  void remove_music(MusicModel music){
    int index = loggedUser!.musics.indexOf(music);
    loggedUser!.musics.removeAt(index);
    update();
  }
}