import 'package:flutter/material.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:food_app/widgets/color_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Itemes'),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20,),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: 'Search for items in the store',
                suffixIcon: Icon(
                  Icons.search,
                  color: textColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
        ],
      ),
    );
  }
}
