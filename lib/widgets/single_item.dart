import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:provider/provider.dart';

import '../providers/review_cart_provider.dart';

class SingleItem extends StatefulWidget {
  SingleItem({
    Key? key,
    required this.isBool,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    this.productQuantity,
    this.onDelete,
  }) : super(key: key);

  bool isBool;
  String productName;
  String productImage;
  String productId;
  int productPrice;
  int? productQuantity;
  VoidCallback? onDelete;

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;

  late int count;

  getCount() {
    setState(() {
      count = widget.productQuantity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  child: Center(
                    child: FancyShimmerImage(
                        imageUrl: widget.productImage,
                        boxFit: BoxFit.scaleDown),
                    // child: Image.network(productImage),
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Product price',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${widget.productPrice} \$',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: primaryColor,
                                  )),
                                ],
                              ),
                            )
                          : Text('1kg'),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                            children: [
                               InkWell(
                                 onTap:widget.onDelete,
                                 child: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.black54,
                                    ),
                               ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 25,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                )),
              ],
            ),
          ),
          widget.isBool == false
              ? Container()
              : Divider(
                  height: 1,
                  color: Colors.black45,
                ),
        ],
      ),
    );
  }
}
