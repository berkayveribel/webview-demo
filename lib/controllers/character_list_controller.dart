import 'package:get/get.dart';
import 'package:marvel_app/data/models/marvel_response.dart';
import 'package:marvel_app/data/repository/marvel_repository.dart';

class CharacterListController extends GetxController
    with StateMixin<Rx<MarvelResponse?>> {
  final _repo = Get.put(MarvelRepository());

  late Rx<MarvelResponse?> _response;

  Rx<MarvelResponse?> get getResponse => _response;

  set setResponse(MarvelResponse? response) => _response.value = response;

  @override
  void onInit() {
    super.onInit();
    _initVariables();
    getCharacters();
  }

  void _initVariables() {
    _response = Rx<MarvelResponse?>(null);
  }

  Future<void> getCharacters() async {
    try {
      change(getResponse, status: RxStatus.loading());
      setResponse = await _repo.getCharacters();
      change(getResponse, status: RxStatus.success());
    } catch (e) {
      change(getResponse,
          status: RxStatus.error('Beklenmedik bir hata oluştu'));
    }
  }
}
