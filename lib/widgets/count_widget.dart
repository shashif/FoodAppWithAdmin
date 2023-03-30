import 'package:flutter/material.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:provider/provider.dart';

class CountWidget extends StatefulWidget {
  CountWidget(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productId,
      required this.productPrice})
      : super(key: key);

  String productName;
  String productImage;
  String productId;

  int productPrice;

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Expanded(
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }

                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                        color: Color(0xffd0b84c), fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });


                    reviewCartProvider.addReviewCartData(
                        cartID: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantitty: count);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
