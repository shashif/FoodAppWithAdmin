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

  List<ReviewCardModel> reviewCartDataList = [];

  void getReviewCartData() async {
    List<ReviewCardModel> newListData = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .orderBy("cartID", descending: true)
        .get();

    querySnapshot.docs.forEach((element) {
      ReviewCardModel reviewCardModel = ReviewCardModel(
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

  List<ReviewCardModel> get getReviewCArtDataList {
    return reviewCartDataList;
  }

}
