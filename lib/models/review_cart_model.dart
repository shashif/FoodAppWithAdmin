class ReviewCartModel {
  String cartID;
  String cartImage;
  String cartName;
  int cartPrice;
  int cartQuantity;
  bool isAdd;

  ReviewCartModel(
      {required this.cartID,
      required this.cartImage,
      required this.cartName,
      required this.cartPrice,
      required this.cartQuantity,
      required this.isAdd,
      });
}
