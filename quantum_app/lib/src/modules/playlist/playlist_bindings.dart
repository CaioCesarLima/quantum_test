import 'package:get/get.dart';

import '../home/home_controller.dart';

class PlaylistBinding implements Bindings {
@override
void dependencies() {
  Get.find<HomeController>();
  }
}