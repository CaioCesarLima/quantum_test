import 'package:get/get.dart';
import 'package:quantum_app/src/core/controllers/user_controller.dart';

class CoreBinding implements Bindings {
@override
void dependencies() {
  Get.put(UserController());
  }
}