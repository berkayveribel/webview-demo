import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
    return Center(
      child: Text('Hello world'),
    );
  }
}
