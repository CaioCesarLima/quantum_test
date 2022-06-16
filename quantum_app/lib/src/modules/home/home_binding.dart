import 'package:get/get.dart';


import 'package:quantum_app/src/data/repository/music_repository.dart';

import './home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController(
     MusicRepository("")));
  }
}