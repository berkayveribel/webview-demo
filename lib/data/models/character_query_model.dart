import 'package:flutter/foundation.dart';

class CharacterQueryModel {
  final int limit;
  final int offset;

  // offset -> for pagination
  // limit -> results to show on screen
  CharacterQueryModel({this.limit = 30, this.offset = 0});

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'offset': offset,
    };
  }

  CharacterQueryModel copyWith({int? limit, int? offset}) {
    return CharacterQueryModel(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}
