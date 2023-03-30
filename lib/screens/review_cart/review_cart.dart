import 'package:flutter/material.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../models/review_cart_model.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

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
                ReviewCardModel data =
                    reviewCartProvider.getReviewCArtDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      productName: data.cartName,
                      productImage: data.cartImage,
                      productPrice: data.cartPrice,
                      productId: data.cartID,
                      productQuantity: data.cartQuantity,
                    ),
                  ],
                );
              },
              itemCount: reviewCartProvider.getReviewCArtDataList.length,
            ),
    );
  }
}
