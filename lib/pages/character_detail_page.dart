import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controllers/character_detail_controller.dart';
import 'package:marvel_app/data/repository/marvel_repository.dart';
import 'package:marvel_app/widgets/widgets_barrel.dart';

class CharacterDetailPage extends StatelessWidget {
  CharacterDetailPage({Key? key}) : super(key: key);

  final controller = Get.put(CharacterDetailController(MarvelRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCharacterCard(),
    );
  }

  Widget _buildCharacterCard() {
    return controller.obx(
      (state) {
        final result = state?.value?.data?.results?[0];
        return CharacterCard(
          result: result,
          type: CharacterCardType.detail,
        );
      },
      onError: (e) => Center(
        child: Text('$e'),
      ),
      onEmpty: const Center(child: Text('İçerik bulunamadı')),
    );
  }

  Widget _buildComicsByCharacter() {
    return Text('Comics by Character');
  }
}
