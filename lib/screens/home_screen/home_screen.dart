import 'package:flutter/material.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/product_overview/product_overview.dart';
import 'package:food_app/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

import '../../widgets/single_products.dart';
import '../review_cart/review_cart.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchProductsData1();
    productProvider.fetchProductsData2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider= Provider.of(context);
    userProvider.getUserData();

    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffd6b738),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xffd4d181),
            radius: 15,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      search: productProvider.getaAllProductSearch,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
              ),
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: CircleAvatar(
              backgroundColor: Color(0xffd4d181),
              radius: 15,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shop,
                  size: 17,
                ),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(userProvider:userProvider),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.tastingtable.com/img/gallery/the-common-vegetable-that-contains-more-protein-than-steak/intro-1647190998.webp'),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.cyan,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: const BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Text(
                                    'Vegetable Shop',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            '30% off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'On All vegitables products',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fresh Fruits',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                              search:
                                  productProvider.getfetchProductsData1List),
                        ),
                      );
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getfetchProductsData1List.map(
                  (value) {
                    return SingleProducts(
                        productName: value.productName,
                        productImage: value.productImage,
                        productPrice: value.productPrice,
                        productId: value.productId,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                    productName: value.productName,
                                    productPrice: value.productPrice,
                                    productImage: value.productImage,
                                    productId: value.productId,
                                  )));
                        });
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Herbs Seasonings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                              search:
                                  productProvider.getfetchProductsData2List),
                        ),
                      );
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getfetchProductsData2List.map(
                  (value) {
                    return SingleProducts(
                        productName: value.productName,
                        productImage: value.productImage,
                        productPrice: value.productPrice,
                        productId: value.productId,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                  productName: value.productName,
                                  productPrice: value.productPrice,
                                  productImage: value.productImage,
                                  productId: value.productId)));
                        });
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Green vegetables',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                              search:
                                  productProvider.getfetchProductsData2List),
                        ),
                      );
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getfetchProductsData2List.map(
                  (value) {
                    return SingleProducts(
                        productName: value.productName,
                        productImage: value.productImage,
                        productPrice: value.productPrice,
                        productId: value.productId,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                    productName: value.productName,
                                    productPrice: value.productPrice,
                                    productImage: value.productImage,
                                    productId: value.productId,
                                  )));
                        });
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
