class ReviewCardModel {
  String cartID;
  String cartImage;
  String cartName;
  int cartPrice;
  int cartQuantitty;

  ReviewCardModel(
      {required this.cartID,
      required this.cartImage,
      required this.cartName,
      required this.cartPrice,
      required this.cartQuantitty});
}
