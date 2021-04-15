import 'package:get/get.dart';
import 'package:webview_demo/webview/webview_page.dart';

import 'url/url_page.dart';

class Routes {
  static const String urlPage = 'url_page';
  static const String webViewPage = 'webview_page';

  static final List<GetPage> getPages = [
    GetPage(name: urlPage, page: () => UrlPage()),
    GetPage(name: webViewPage, page: () => WebViewPage()),
  ];
}
