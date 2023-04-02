import 'package:flutter/material.dart';

class bottomNavigatorBar extends StatefulWidget {
  bottomNavigatorBar(
      {Key? key,
      this.iconColor,
      this.backgroundColor,
      this.color,
      this.title,
      this.iconData,
      this.onTap,
      })
      : super(key: key);

  Color? iconColor;
  Color? backgroundColor;
  Color? color;
  String? title;

  IconData? iconData;
  VoidCallback? onTap;

  @override
  State<bottomNavigatorBar> createState() =>
      _bottomNavigatorBarState();
}

class _bottomNavigatorBarState extends State<bottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: widget.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.iconData,
                size: 20,
                color: widget.iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.title!,
                style: TextStyle(
                  color: widget.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
