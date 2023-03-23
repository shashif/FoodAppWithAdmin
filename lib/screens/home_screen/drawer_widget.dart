import 'package:flutter/material.dart';

import '../../widgets/drawer_list_tile_widget.dart';
class drawer_widget extends StatelessWidget {
  const drawer_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome Huest'),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            listTile(iconData: Icons.home_outlined, title: "Home"),
            listTile(iconData: Icons.shop_outlined, title: "Review Cart"),
            listTile(iconData: Icons.person_outlined, title: "My Profile"),
            listTile(
                iconData: Icons.notifications_outlined,
                title: "Notification"),
            listTile(
                iconData: Icons.star_outlined, title: "Rating and Review"),
            listTile(iconData: Icons.favorite_outlined, title: "Wishlist"),
            listTile(
                iconData: Icons.copy_outlined, title: "Raise & Complaint"),
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Support'),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Call us:'),
                        SizedBox(width: 10,),
                        Text('+8801611500060'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Mail us:'),
                        SizedBox(width: 10,),
                        Text('shoriful.hasan@gmail.com'),
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