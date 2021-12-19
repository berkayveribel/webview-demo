import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controllers/controllers_barrel.dart';
import 'package:marvel_app/route_manager.dart';

import 'package:marvel_app/widgets/widgets_barrel.dart';

class CharactersPage extends StatelessWidget {
  CharactersPage({Key? key}) : super(key: key);

  final controller = Get.put(CharacterListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      title: const Text('Marvel Characters'),
    );
  }

  Widget _buildBody() {
    return controller.obx(
      (state) {
        debugPrint('Sonuçların boyutu ${state?.value?.data?.results?.length}');

        final data = state?.value;
        return GridView.builder(
          controller: controller.scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: data?.data?.results?.length,
          itemBuilder: (BuildContext context, int index) {
            final singleCharacter = data?.data?.results?[index];

            return InkWell(
              onTap: () => Get.toNamed(Routes.characterDetail,
                  arguments: singleCharacter?.id),
              child: CharacterCard(
                result: singleCharacter,
              ),
            );
          },
        );
      },
      onEmpty: const OnEmpty(message: 'Character not found'),
      onError: (e) => OnError(message: e!),
    );
  }
}
