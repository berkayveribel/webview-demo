import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controllers/controllers_barrel.dart';
import 'package:marvel_app/data/repository/marvel_repository.dart';
import 'package:marvel_app/widgets/widgets_barrel.dart';

class CharacterDetailPage extends StatelessWidget {
  CharacterDetailPage({Key? key}) : super(key: key);

  final controller = Get.put(CharacterDetailController(MarvelRepository()));
  final comicsController = Get.put(ComicsListController(MarvelRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(child: _buildCharacterCard()),
        Expanded(
          child: _buildComics(),
        ),
      ],
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

  PreferredSizeWidget _buildAppBar() {
    return const CustomAppBar(
      title: 'CharacterDetail',
    );
  }

  Widget _buildComics() {
    return comicsController.obx(
      (state) {
        final comics = state?.value?.data?.results;
        return ListView.builder(
          itemCount: comics?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text('Title ${comics?[index].title}'),
            );
          },
        );
      },
      onEmpty: const OnEmpty(message: 'Comics not found'),
      onError: (e) => OnError(message: e!),
    );
  }
}
