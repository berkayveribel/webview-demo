import 'package:get/get.dart';

class UrlController extends GetxController {
  // lifecyle'ı çalıştırmadan controller'a erişmek için
  static UrlController get to => Get.find();
  // girilen url'yi tutar
  RxString _url;

  // getterlar ve setterlar
  RxString get getUrl => _url;
  set setUrl(String url) {
    if (url != null) {
      _url.value = url;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initVariables();
  }

  void _initVariables() {
    _url = ''.obs;
  }
}
