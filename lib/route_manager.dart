import 'package:get/get.dart';
import 'package:marvel_app/pages/character_detail_page.dart';
import 'package:marvel_app/pages/characters_page.dart';

class Routes {
  static const String characters = '/';
  static const String characterDetail = '/character_detail';

  static final List<GetPage> getPages = [
    GetPage(name: characters, page: () => CharactersPage()),
    GetPage(name: characterDetail, page: () => CharacterDetailPage()),
  ];
}
