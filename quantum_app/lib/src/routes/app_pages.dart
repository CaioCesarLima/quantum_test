
import 'package:get/get.dart';
import 'package:quantum_app/src/modules/home/home_binding.dart';

import '../modules/playlist/playlist_bindings.dart';
import '../modules/playlist/playlist_page.dart';
import './app_routes.dart';

import '../modules/home/home_page.dart';

class AppPages {
  
  static final pages = [
    GetPage(name: Routes.HOME, page:()=> HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.INITIAL, page:()=> PlaylistPage(), binding: PlaylistBinding()),

  ];
}