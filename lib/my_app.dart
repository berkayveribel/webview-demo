import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marvel Characters',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: CharactersPage(),
      //initialBinding: Binds(), // ? çalışmıyor
      initialRoute: Routes.characters,
      getPages: Routes.getPages,
    );
  }
}
