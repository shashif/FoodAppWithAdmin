import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/wishlist_provider.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottomNavigatorBar_widget.dart';
import '../../widgets/count_widget.dart';
import '../review_cart/review_cart.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
   ProductOverview({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
  }) : super(key: key);
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  var productUnit;

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  bool wishLishtBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourWishList')
        .doc(widget.productId)
        .get()
        .then((value) {
      if (this.mounted) {
        if (value.exists) {
          setState(() {
            wishLishtBool = value.get('wishList');
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add to whishlist",
            iconData: wishLishtBool == false
                ? Icons.favorite_outline
                : Icons.favorite,
            onTap: () {
              setState(() {
                wishLishtBool = !wishLishtBool;
              });
              if (wishLishtBool == true) {
                wishListProvider.addWishListData(
                  wishListId: widget.productId,
                  wishListName: widget.productName,
                  wishListImage: widget.productImage,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: 2,
                );
              } else {
                wishListProvider.deleteWishtList(widget.productId);
              }
            },
          ),
          bottomNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Add to cart",
              iconData: Icons.shop_outlined,
            onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart(),),);
            },
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName ?? ""),
                      subtitle: Text('\$ ${widget.productPrice}'),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: FancyShimmerImage(
                          imageUrl: widget.productImage,
                          boxFit: BoxFit.fitHeight),
                      // child: Image.network(widget.productImage??""),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        'Available Option',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                value: SigninCharacter.fill,
                                groupValue: _character,
                                activeColor: Colors.green[700],
                                onChanged: (value) {
                                  setState(() {
                                    _character = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text('\$ ${widget.productPrice}'),
                          CountWidget(
                            productId: widget.productId,
                            productName: widget.productName,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                            productUnit: widget.productUnit,
                          ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 10),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.grey),
                          //     borderRadius: BorderRadius.circular(30),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.add,
                          //         size: 15,
                          //         color: primaryColor,
                          //       ),
                          //       Text(
                          //         'ADD',
                          //         style: TextStyle(
                          //           color: primaryColor,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About this product',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Product description',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
