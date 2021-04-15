import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_demo/url/url_controller.dart';

import '../routes.dart';

class UrlPage extends StatelessWidget {
  // controller
  final urlController = Get.find<UrlController>();

  // text editing controller
  final urlTfController = TextEditingController();

  // formun validation gibi değerlerini tutar
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webview Demo'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          _buildUrlInput(),
          _buildGoUrlButton(),
        ],
      ),
    );
  }

  Widget _buildUrlInput() {
    return TextFormField(
      controller: urlTfController,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        bool isEmail = GetUtils.isURL(value);
        if (isEmail != true) {
          return 'Girilen değer web adresi olmalı!';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: 'Adres',
        hintText: 'https://..',
      ),
    );
  }

  Widget _buildGoUrlButton() {
    return ElevatedButton(
        onPressed: () {
          // formun valide olup olmadığını kontrol edelim
          // valide olduysa
          if (_formKey.currentState.validate()) {
            // girilen url'yi url değerini tutan değişkene set edelim
            urlController.setUrl = urlTfController.text;
            // webview sayfasına gidelim
            Get.toNamed(Routes.webViewPage);
          }
          // valide olmadıysa - hiç bir şey yapma
        },
        child: Text('GİT'));
  }
}
