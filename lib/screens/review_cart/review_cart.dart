import 'package:flutter/material.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../models/review_cart_model.dart';

class ReviewCart extends StatelessWidget {
  // late ReviewCartProvider reviewCartProvider;

  //dialog start
  // showAlertDialog(BuildContext context, ReviewCartModel delete) {
  //
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text("No"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("Yes"),
  //     onPressed: () {
  //
  //       reviewCartProvider.reviewCartDataDelete(delete.cartID);
  //       Navigator.of(context).pop();
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Cart Product"),
  //     content: Text("Are you devete on cartProduct?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  //dialog end
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Review cart',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total amount'),
        subtitle: Text(
          '170.00',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text('Submit'),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
          ),
        ),
      ),
      body: reviewCartProvider.getReviewCArtDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCArtDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      wishList: false,
                      productName: data.cartName,
                      productImage: data.cartImage,
                      productPrice: data.cartPrice,
                      productId: data.cartID,
                      productQuantity: data.cartQuantity,
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
                            reviewCartProvider
                                .reviewCartDataDelete(data.cartID);
                            Navigator.of(context).pop();
                          },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text("Cart Product"),
                          content: Text("Are you devete on cartProduct?"),
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
              itemCount: reviewCartProvider.getReviewCArtDataList.length,
            ),
    );
  }
}
