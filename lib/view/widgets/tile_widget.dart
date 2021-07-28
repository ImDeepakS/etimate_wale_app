import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final page;
  const TileWidget({
    Key? key,
    required this.title,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      focusColor: Colors.grey[400],
      hoverColor: Colors.yellow,
      tileColor: Colors.grey.shade200,
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
    );
  }
}
