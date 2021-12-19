import 'package:flutter/material.dart';
import 'package:marvel_app/data/models/comics_response.dart';

class ComicsCard extends StatelessWidget {
  const ComicsCard({Key? key, this.comics}) : super(key: key);
  final Result? comics;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Title ${comics?.title}'),
      ),
    );
  }
}
