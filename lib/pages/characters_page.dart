import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controllers/character_list_controller.dart';
import 'package:marvel_app/widgets/character_card.dart';

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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return CharacterCard(
              result: data?.data?.results?[index],
            );
          },
        );
      },
      onEmpty: const Text('Boş geldi'),
      onError: (e) => Text('$e'),
    );
  }
}
