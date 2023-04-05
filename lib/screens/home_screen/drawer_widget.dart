import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';

import '../../widgets/drawer_list_tile_widget.dart';
import '../review_cart/review_cart.dart';
import '../wishlist/wish_list.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 43,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Welcome Huest'),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 30,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            listTile(
                iconData: Icons.home_outlined, title: "Home", onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }),
            listTile(
                iconData: Icons.shop_outlined,
                title: "Review Cart",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart()));
                }),
            listTile(
                iconData: Icons.person_outlined,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyProfile()));
                }),
            listTile(
                iconData: Icons.notifications_outlined,
                title: "Notification",
                onTap: () {}),
            listTile(
                iconData: Icons.star_outlined,
                title: "Rating and Review",
                onTap: () {}),
            listTile(
                iconData: Icons.favorite_outlined,
                title: "Wishlist",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WishListScreen()));

                }),
            listTile(
                iconData: Icons.copy_outlined,
                title: "Raise & Complaint",
                onTap: () {}),
            listTile(
                iconData: Icons.format_quote_outlined,
                title: "FAQs",
                onTap: () {}),
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact Support'),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text('Call us:'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('+8801611500060'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text('Mail us:'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('shoriful.hasan@gmail.com'),
                      ],
                    ),
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
