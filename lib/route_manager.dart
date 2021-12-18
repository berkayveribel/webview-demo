import 'package:flutter/material.dart';
import 'package:marvel_app/pages/characters_page.dart';

class RouteManager {
  static const String charactersPage = '/';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersPage:
        return MaterialPageRoute(builder: (_) => CharactersPage());
      default:
    }
  }
}
