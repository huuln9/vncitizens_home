import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncitizens/menu_ui.dart';
import 'package:vncitizens_home/vncitizens_home.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/te', page: () => const MenuUI()),
        GetPage(name: '/', page: () => const Splash()),
        GetPage(name: '/home', page: () => const Home()),
      ],
    ),
  );
}
