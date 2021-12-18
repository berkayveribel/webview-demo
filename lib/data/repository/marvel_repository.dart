import 'package:marvel_app/data/models/marvel_response.dart';
import 'package:marvel_app/data/repository/base_service.dart';

class MarvelRepository {
  final _dio = BaseService();

  @override
  Future<MarvelResponse> getCharacters() async {
    final response = await _dio.get(
      '/v1/public/characters',
    );

    return MarvelResponse.fromJson(response.data);
  }
}
