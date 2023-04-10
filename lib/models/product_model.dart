class ProductModel {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  int? productQuantity;
  List<dynamic> productUnit;

  ProductModel(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId,
      this.productQuantity,
       required this.productUnit,
      });
}
