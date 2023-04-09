import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:provider/provider.dart';

import '../providers/review_cart_provider.dart';
import 'count_widget.dart';

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
    required this.wishList,
  }) : super(key: key);

  bool isBool = false;
  bool wishList = false;
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
      count = widget.productQuantity ?? 0;
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
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            title: new Text('50 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: new Text('500 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: new Text('1 Kg'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
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
                                        '${widget.productPrice} \$ or 50 gram',
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
                      ? CountWidget(
                          productId: widget.productId,
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productPrice: widget.productPrice,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: widget.onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              widget.wishList == false
                                  ? Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.remove,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                if (count == 1) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "You reach minimum limit");
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                          cartID:
                                                              widget.productId,
                                                          cartImage: widget
                                                              .productImage,
                                                          cartName: widget
                                                              .productName,
                                                          cartPrice: widget
                                                              .productPrice,
                                                          cartQuantity: count);
                                                }
                                              },
                                            ),
                                            Text(
                                              '$count',
                                              style: TextStyle(
                                                color: primaryColor,
                                              ),
                                            ),
                                            InkWell(
                                              child: Icon(
                                                Icons.add,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                if (count < 10) {
                                                  setState(() {
                                                    count++;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                          cartID:
                                                              widget.productId,
                                                          cartImage: widget
                                                              .productImage,
                                                          cartName: widget
                                                              .productName,
                                                          cartPrice: widget
                                                              .productPrice,
                                                          cartQuantity: count);
                                                }else{
                                                  Fluttertoast.showToast(
                                                      msg:
                                                      "Maximum Limit Exixts");
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
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
