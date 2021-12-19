import 'package:marvel_app/data/models/character_query_model.dart';
import 'package:marvel_app/data/models/comics_response.dart';
import 'package:marvel_app/data/models/marvel_response.dart';
import 'package:marvel_app/data/repository/base_service.dart';

class MarvelRepository {
  final _dio = BaseService();

  Future<MarvelResponse> getCharacters(
      {required CharacterQueryModel queryParams}) async {
    final response = await _dio.get(
      '/v1/public/characters',
      queryParameters: queryParams.toMap(),
    );

    return MarvelResponse.fromJson(response.data);
  }

  Future<MarvelResponse> getSingleCharacter({required int characterId}) async {
    final response = await _dio.get(
      '/v1/public/characters/$characterId',
      queryParameters: {'characterId': characterId},
    );

    return MarvelResponse.fromJson(response.data);
  }

  Future<ComicsResponse> getComicsByCharacter(
      {required int characterId}) async {
    final response = await _dio.get(
      '/v1/public/characters/$characterId/comics',
    );

    return ComicsResponse.fromJson(response.data);
  }
}
