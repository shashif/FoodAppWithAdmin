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
          cartQuantity: element.get('cartQuantity'));

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
}
