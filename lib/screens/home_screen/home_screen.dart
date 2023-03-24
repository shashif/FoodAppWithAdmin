import 'package:flutter/material.dart';
import 'package:food_app/screens/product_overview/product_overview.dart';

import '../../widgets/drawer_list_tile_widget.dart';
import '../../widgets/single_products.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        actions: const [
          CircleAvatar(
            backgroundColor: Color(0xffd4d181),
            radius: 12,
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xffd4d181),
              radius: 12,
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: drawer_widget(),
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
                        'https://www.tastingtable.com/img/gallery/the-common-vegetable-that-contains-more-protein-than-steak/intro-1647190998.webp')),
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
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 20,
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
                children: const [
                  Text(
                    'Herbs Seasonings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',
                      onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductOverview()));
                  }),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',
                      onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductOverview()));
                  }),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',
                      onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductOverview()));
                  }),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',
                      onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductOverview()));
                  }),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',
                      onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductOverview()));
                  }),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Fresh Fruits',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',onTap: (){}),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',onTap: (){}),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',onTap: (){}),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',onTap: (){}),
                  SingleProducts(productname: 'Basil',productImage: 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png',onTap: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Widget SingleProducts() {
//   return Container(
//     height: 230,
//     width: 150,
//     margin: EdgeInsets.symmetric(horizontal: 5),
//     decoration: BoxDecoration(
//       color: const Color(0xffd9dad9),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Image.network(
//                 'https://www.theproducemoms.com/wp-content/uploads/2022/01/basil.png'),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Fresh Basil',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const Text(
//                   '50\$ / 50 Gram',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 30,
//                         width: 50,
//                         // padding: EdgeInsets.only(left: 5),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: const [
//                               Text('50 Gram',
//                                   style: TextStyle(
//                                     fontSize: 11,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 30,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: const [
//                               Icon(
//                                 Icons.remove,
//                                 size: 20,
//                                 color: Color(0xffd0b84c),
//                               ),
//                               Text(
//                                 '1',
//                                 style: TextStyle(
//                                     color: Color(0xffd0b84c),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Icon(
//                                 Icons.add,
//                                 size: 20,
//                                 color: Color(0xffd0b84c),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget listTile(
//   {required IconData iconData, required String title}
// ) {
//   return ListTile(
//     leading: Icon(
//       iconData,
//       size: 32,
//     ),
//     title: Text(
//       title,
//       style: TextStyle(
//         color: Colors.black45,
//       ),
//     ),
//   );
// }
