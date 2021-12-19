import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:marvel_app/data/models/marvel_response.dart';
import 'package:marvel_app/data/repository/repository_barrel.dart';

class CharacterDetailController extends GetxController
    with StateMixin<Rx<MarvelResponse?>> {
  CharacterDetailController(this.repository);

  final MarvelRepository repository;

  // servisten dönen isteği tutar
  late Rx<MarvelResponse?> _response;

  // getters & setters
  Rx<MarvelResponse?> get getResponse => _response;

  set setResponse(MarvelResponse? response) => _response.value = response;

  @override
  void onInit() {
    super.onInit();
    _initVariables();
    getSingleCharacter(characterId: Get.arguments);
  }

  void _initVariables() {
    _response = Rx<MarvelResponse?>(null);
  }

  Future<void> getSingleCharacter({required int characterId}) async {
    try {
      change(getResponse, status: RxStatus.loading());

      setResponse =
          await repository.getSingleCharacter(characterId: characterId);

      change(getResponse, status: RxStatus.success());
    } catch (e) {
      change(getResponse,
          status: RxStatus.error('Beklenmedik bir hata oluştu'));
    }
  }
}
