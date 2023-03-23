import 'package:flutter/material.dart';

class listTile extends StatelessWidget {
  listTile({Key? key, required this.iconData, required this.title})
      : super(key: key);

  IconData iconData;
  String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black45,
        ),
      ),
    );
    ;
  }
}
