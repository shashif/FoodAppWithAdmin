import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartID,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantitty,
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
        "cartQuantitty": cartQuantitty,
      },
    );
  }
}
