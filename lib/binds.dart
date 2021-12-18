import 'package:get/get.dart';
import 'package:marvel_app/controllers/character_list_controller.dart';
import 'package:marvel_app/data/repository/marvel_repository.dart';

class Binds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarvelRepository(), fenix: true);
    Get.lazyPut(() => CharacterListController(), fenix: true);
  }
}
