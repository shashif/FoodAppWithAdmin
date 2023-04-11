import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartID,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
    var cartUnit,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(cartID)
        .set(
      {
        "cartID": cartID,
        "cartImage": cartImage,
        "cartName": cartName,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
        "cartUnit": cartUnit,
      },
    );
  }

  /////////////////////////////get cart data start//////////////////////
  List<ReviewCartModel> reviewCartDataList = [];

  void getReviewCartData() async {
    List<ReviewCartModel> newListData = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .orderBy("cartID", descending: true)
        .get();

    querySnapshot.docs.forEach((element) {
      ReviewCartModel reviewCardModel = ReviewCartModel(
        cartID: element.get('cartID'),
        cartImage: element.get('cartImage'),
        cartName: element.get('cartName'),
        cartPrice: element.get('cartPrice'),
        cartQuantity: element.get('cartQuantity'),
        isAdd: element.get('isAdd'),
        cartUnit: element.get('cartUnit'),
      );

      newListData.add(reviewCardModel);
    });

    reviewCartDataList = newListData;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCArtDataList {
    return reviewCartDataList;
  }

/////////////////////////////get cart data end//////////////////////

///////////////////////////// cart data Delete  Start//////////////////////

  reviewCartDataDelete(cartID) {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartID)
        .delete();
    notifyListeners();
  }

///////////////////////////// cart data Delete  End///////////////////////

///////////////////////////// Total Price  Start///////////////////////
  getTotalPrice() {
    double total = 0.0;
    reviewCartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;

    });
    return total;
  }

///////////////////////////// Total Price  End/////////////////////////

///////////////////////////// cart data Update  Start///////////////////////
  void updateReviewCartData({
    required String cartID,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(cartID)
        .update(
      {
        "cartID": cartID,
        "cartImage": cartImage,
        "cartName": cartName,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }
///////////////////////////// cart data Update  End/////////////////////////
}
