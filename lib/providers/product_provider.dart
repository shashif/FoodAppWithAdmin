import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel>searchLlist=[];
  productsModel(QueryDocumentSnapshot element) {
    productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"));

    searchLlist.add(productModel);
  }

///////////////////////////////////Search Start/////////////////////////////////////
  List<ProductModel> get getaAllProductSearch {
    return searchLlist;
  }

  ///////////////////////////////////Search End/////////////////////////////////////

  ///////////////////////////////////fetchProductsData1 Start/////////////////////////////////////
  List<ProductModel> product1List = [];

  fetchProductsData1() async {
    List<ProductModel>? newList = [];
    QuerySnapshot querySnapshotValue =
        await FirebaseFirestore.instance.collection("ProductCategory1").orderBy("productName", descending: true).get();
    querySnapshotValue.docs.forEach((element) {
      // print(element.data());
      // print('this is iphone');

      productsModel(element);

      newList.add(productModel);
    });

    product1List = newList;
    notifyListeners();
  }

  List<ProductModel> get getfetchProductsData1List {
    return product1List;
  }

/////////////////////////////////////fetchProductsData1 End/////////////////////////////////////


/////////////////////////////////////fetchProductsData2 Start///////////////////////////////////
  List<ProductModel> product2List = [];

  fetchProductsData2() async {
    List<ProductModel>? newList = [];
    QuerySnapshot querySnapshotValue =
        await FirebaseFirestore.instance.collection("ProductCategory2").orderBy("productName", descending: true).get();
    querySnapshotValue.docs.forEach((element) {
      // print(element.data());
      // print('this is iphone2');

      productsModel(element);

      newList.add(productModel);
    });

    product2List = newList;
    notifyListeners();
  }

  List<ProductModel> get getfetchProductsData2List {
    return product2List;
  }

///////////////////////////////////fetchProductsData2 End/////////////////////////////////////
}
