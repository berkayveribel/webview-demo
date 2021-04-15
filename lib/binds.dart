import 'package:get/get.dart';
import 'package:webview_demo/url/url_controller.dart';

class Binds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UrlController(), fenix: true);
  }
}
