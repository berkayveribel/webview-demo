import 'package:flutter/material.dart';
import 'package:webview_demo/url/url_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  _buildBody() {
    return WebView(
      initialUrl: UrlController.to.getUrl.value ?? 'https://google.com.tr',
      // javascript runtime'a izin vermek için
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
