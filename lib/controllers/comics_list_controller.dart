import 'package:get/get.dart';
import 'package:marvel_app/data/models/comics_query_model.dart';
import 'package:marvel_app/data/models/comics_response.dart';
import 'package:marvel_app/data/repository/marvel_repository.dart';

class ComicsListController extends GetxController
    with StateMixin<Rx<ComicsResponse?>> {
  ComicsListController(this.repository);

  final MarvelRepository repository;

  // servisten dönen nesneyi tutar
  late Rx<ComicsResponse?> _response;

  // servise gönderilecek parametreleri (startYear=2005,limit=10,orderBy=onsaleDate)
  late ComicsQueryModel _queryParams;

  // getters & setters
  Rx<ComicsResponse?> get getResponse => _response;

  set setResponse(ComicsResponse? value) => _response.value = value;

  @override
  void onInit() {
    super.onInit();
    _initVariables();
    getComicsByCharacter(characterId: Get.arguments);
  }

  void _initVariables() {
    _response = Rx<ComicsResponse?>(null);
    _queryParams = ComicsQueryModel();
  }

  Future<void> getComicsByCharacter({required int characterId}) async {
    try {
      change(getResponse, status: RxStatus.loading());

      setResponse = await repository.getComicsByCharacter(
          characterId: characterId, queryParams: _queryParams);

      final isEmpty = getResponse.value?.data?.results?.isEmpty == true;
      if (isEmpty) {
        change(getResponse, status: RxStatus.empty());
      } else {
        change(getResponse, status: RxStatus.success());
      }
    } catch (e) {
      change(getResponse,
          status: RxStatus.error('Beklenmedik bir hata oluştu'));
    }
  }
}
