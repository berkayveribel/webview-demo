import 'package:flutter/material.dart';
import 'package:marvel_app/data/models/result.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, this.result}) : super(key: key);
  final Result? result;

  final dummyPhotoUrl =
      'https://cdn.pixabay.com/photo/2017/11/26/00/46/captain-marvel-2977923__340.jpg';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: _buildImage()),
          _buildName(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    final thumbnail = result?.thumbnail;
    return Row(
      children: [
        Expanded(
          child: Image.network(
            '${thumbnail?.path}.${thumbnail?.ext}',
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
}
