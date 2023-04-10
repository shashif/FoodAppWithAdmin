import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required int wishListPrice,
    required int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourWishList')
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListImage": wishListImage,
        "wishListName": wishListName,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true,
      },
    );
  }

  ///////////////get wishList data Stat//////////

  List<ProductModel> wishListData = [];

  getWishListDataFn() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourWishList')
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productImage: element.get('wishListImage'),
        productName: element.get('wishListName'),
        productPrice: element.get('wishListPrice'),
        productId: element.get('wishListId'),
        productQuantity: element.get('wishListQuantity'),
        productUnit: [],
      );

      newList.add(productModel);
    });

    wishListData = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishListData;
  }

///////////////get wishList data End///////////

/////////////////DELETE wishlist data Start//////////////////

  deleteWishtList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }
/////////////////DELETE wishlist data End////////////////////
}
