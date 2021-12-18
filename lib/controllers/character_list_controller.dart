import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:marvel_app/data/models/models_barrel.dart';

import 'package:marvel_app/data/repository/marvel_repository.dart';

class CharacterListController extends GetxController
    with StateMixin<Rx<MarvelResponse?>> {
  final _repo = Get.put(MarvelRepository());

  // servisten dönen isteği tutar
  late Rx<MarvelResponse?> _response;

  // servise gönderilen queryParams' ı tutar
  late CharacterQueryModel _queryParams;

  // gridView'daki scroll'ı dinler
  late ScrollController scrollController;

  // getters & setters
  Rx<MarvelResponse?> get getResponse => _response;

  set setResponse(MarvelResponse? response) => _response.value = response;

  // stateful widgettaki initState ' e karşılık gelir
  // sayfa açıldığında 1 defaya mahsus çalışır
  @override
  void onInit() {
    super.onInit();
    _initVariables();
    getCharacters();
    _listenScroll();
  }

  // değişkenleri başlatır -> initialization
  void _initVariables() {
    _response = Rx<MarvelResponse?>(null);
    scrollController = ScrollController();
    _queryParams = CharacterQueryModel();
  }

  // servisten marvel karakterlerini ister
  Future<void> getCharacters() async {
    try {
      change(getResponse, status: RxStatus.loading());
      setResponse = await _repo.getCharacters(
        queryParams: _queryParams,
      );
      change(getResponse, status: RxStatus.success());
    } catch (e) {
      change(getResponse,
          status: RxStatus.error('Beklenmedik bir hata oluştu'));
    }
  }

  // sayfadaki gridview 'ın scroll'ını dinler
  void _listenScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreCharacters();
      }
    });
  }

  // servisten belirlenen miktarda (30) daha fazla süper kahraman ister
  void getMoreCharacters() async {
    _queryParams = _queryParams.copyWith(
      offset: _queryParams.offset + 30,
    );
    debugPrint('offset ${_queryParams.offset}');
    final response = await _repo.getCharacters(
      queryParams: _queryParams,
    );
    final results = response.data?.results;
    if (results?.isNotEmpty == true) {
      getResponse.value?.data?.results?.addAll(results ?? []);

      change(getResponse, status: RxStatus.success());
    }
  }
}
