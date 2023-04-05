import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/providers/wishlist_provider.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../models/review_cart_model.dart';

class WishListScreen extends StatefulWidget {
  late WishListProvider wishListProvider;

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  // late ReviewCartProvider reviewCartProvider;
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    wishListProvider.getWishListDataFn();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Wish List',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body:  wishListProvider.getWishList.isEmpty
          ? Center(
        child: Text("NO DATA"),
      )
          :ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                wishList: true,
                productName: data.productName,
                productImage: data.productImage,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {


                  // showAlertDialog(context, data);
// set up the buttons
                  Widget cancelButton = TextButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                  Widget continueButton = TextButton(
                    child: Text("Yes"),
                    onPressed: () {
                      wishListProvider.deleteWishtList(data.productId);
                      Navigator.of(context).pop();
                    },
                  );

                  // set up the AlertDialog
                  AlertDialog alert = AlertDialog(
                    title: Text("WIshList Product"),
                    content: Text("Are you delete this Wish List?"),
                    actions: [
                      cancelButton,
                      continueButton,
                    ],
                  );

                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                  
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
