import 'dart:ffi';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:food_app/widgets/product_unit.dart';

import 'count_widget.dart';

class SingleProducts extends StatefulWidget {
  const SingleProducts({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.onTap,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
  }) : super(key: key);

  final String productImage;
  final String productName;
  final String productId;
  final int productPrice;
  final ProductModel productUnit;
  final void Function()? onTap;

  @override
  State<SingleProducts> createState() => _SingleProductsState();
}

class _SingleProductsState extends State<SingleProducts> {
  var unitData;
  var firstValue;

  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 210,
        width: 160,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: const Color(0xffd9dad9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: FancyShimmerImage(
                      imageUrl: widget.productImage, boxFit: BoxFit.fitHeight),
                  // child: Image.network(
                  //     productImage),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${widget.productPrice} \$ / ${unitData==null?firstValue:unitData}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ProductUnit(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        children: widget.productUnit.productUnit
                                            .map<Widget>((data) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      unitData = data;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    data,
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                        mainAxisSize: MainAxisSize.min,
                                      );
                                    });
                              },
                              title: unitData==null?firstValue:unitData),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CountWidget(
                            productId: widget.productId,
                            productName: widget.productName,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                            productUnit: unitData==null?firstValue:unitData,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
