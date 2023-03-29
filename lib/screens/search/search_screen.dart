import 'package:flutter/material.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:food_app/widgets/color_widget.dart';

import '../../models/product_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, required this.search}) : super(key: key);

  // SearchScreen({super.key, required this.search});
  final List<ProductModel> search;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String query="";

  searchItem(String query) {
    List<ProductModel> searchContent = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchContent;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem= searchItem(query);
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
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              onChanged:(value){
                setState(() {
                  query= value;
                });
              } ,
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
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productName: data.productName,
                productImage: data.productImage,
                productPrice: data.productPrice,
              );
            }).toList(),
          ),

          // SingleItem(isBool: false),
          // SingleItem(isBool: false),
          // SingleItem(isBool: false),
          // SingleItem(isBool: false),
        ],
      ),
    );
  }
}
