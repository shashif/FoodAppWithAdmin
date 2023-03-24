import 'dart:ffi';

import 'package:flutter/material.dart';

class SingleProducts extends StatelessWidget {
  const SingleProducts(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.onTap})
      : super(key: key);

  final String productImage;
  final String productName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 150,
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
                onTap:onTap ,
                child: Image.network(
                    productImage),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                     productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '50\$ / 50 Gram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 30,
                          width: 50,
                          // padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('50 Gram',
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Color(0xffd0b84c),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Color(0xffd0b84c),
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Color(0xffd0b84c),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
