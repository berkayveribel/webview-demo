import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_demo/binds.dart';
import 'package:webview_demo/url/url_page.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webview Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: Routes.urlPage,
      getPages: Routes.getPages,
      initialBinding: Binds(),
      // home: UrlPage(),
    );
  }
}
