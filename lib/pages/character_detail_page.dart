import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controllers/character_detail_controller.dart';
import 'package:marvel_app/data/repository/marvel_repository.dart';

class CharacterDetailPage extends StatelessWidget {
  CharacterDetailPage({Key? key}) : super(key: key);

  final controller = Get.put(CharacterDetailController(MarvelRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildCharacterCard(),
          _buildComicsByCharacter(),
        ],
      ),
    );
  }

  Widget _buildCharacterCard() {
    return controller.obx(
      (state) {
        final data = state?.value?.data?.results?.length;
        debugPrint('sonuçların boyutu $data');
        return Card(
          child: Column(
            children: [
              Text('Character Name'),
              Text('Character Photo'),
              Text('Character Desc'),
            ],
          ),
        );
      },
      onError: (e) => Center(
        child: Text('$e'),
      ),
      onEmpty: const Center(child: Text('İçerik bulunamadı')),
    );

    /*   return Card(
      child: Column(
        children: [
          Text('Character Name'),
          Text('Character Photo'),
          Text('Character Desc'),
        ],
      ),
    ); */
  }

  Widget _buildComicsByCharacter() {
    return Text('Comics by Character');
  }
}
