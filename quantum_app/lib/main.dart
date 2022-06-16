import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantum_app/src/core/controllers/user_controller.dart';
import 'package:quantum_app/src/modules/home/home_binding.dart';
import 'package:quantum_app/src/modules/home/home_page.dart';
import 'package:quantum_app/src/routes/app_pages.dart';
import 'package:quantum_app/src/routes/app_routes.dart';

import './src/core/bindings/core_binding.dart';



void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      initialBinding: CoreBinding(),
      theme: ThemeData.dark(),
      getPages: AppPages.pages,
    )
  );
}

