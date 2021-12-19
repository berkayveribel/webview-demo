import 'package:flutter/material.dart';
import 'package:marvel_app/data/models/result.dart';

enum CharacterCardType { list, detail }

class CharacterCard extends StatelessWidget {
  const CharacterCard(
      {Key? key, required this.result, this.type = CharacterCardType.list})
      : super(key: key);
  final Result? result;
  final CharacterCardType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: _buildImage()),
          _buildName(),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    final thumbnail = result?.thumbnail;
    final imagePath = '${thumbnail?.path}.${thumbnail?.ext}';
    return Row(
      children: [
        Expanded(
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildName() {
    final name = result?.name;
    return Text(
      '$name',
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 1,
    );
  }

  _buildDescription() {
    final description = result?.description;
    return Visibility(
      visible: type == CharacterCardType.detail,
      child: Text(
        '$description',
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
