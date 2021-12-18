import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCharacterCard(),
        _buildComicsByCharacter(),
      ],
    );
  }

  Widget _buildCharacterCard() {
    return Card(
      child: Column(
        children: [
          Text('Character Name'),
          Text('Character Photo'),
          Text('Character Desc'),
        ],
      ),
    );
  }

  Widget _buildComicsByCharacter() {
    return Text('Comics by Character');
  }
}
