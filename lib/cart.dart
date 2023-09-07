import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


import 'cartpage.dart';
import 'homepage.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // bottomNavigationBar:Container(
      //
      //   margin: EdgeInsets.all(12),
      //
      //   decoration: BoxDecoration(
      //
      //     borderRadius: BorderRadius.all(Radius.circular(36)),
      //     color: Colors.blueAccent.shade100,
      //   ),
      //
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 2,vertical: 12),
      //     child: GNav(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       backgroundColor: Colors.transparent,
      //       // backgroundColor: Colors.blueAccent.shade100,
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: Colors.black,
      //       padding: EdgeInsets.all(12),
      //       gap: 8,
      //       tabs: [
      //         GButton(
      //           icon: Icons.home ,
      //           text: "Home",
      //           onPressed: (){
      //
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) =>  homepage()),
      //             );
      //
      //           },
      //
      //         ),
      //         GButton(
      //
      //           icon: Icons.shopping_bag_outlined ,
      //           text: "Shop Now",
      //           onPressed: (){
      //
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) =>  shopnow()),
      //             );
      //
      //           },
      //         ),
      //
      //         GButton(
      //
      //           icon: Icons.shopping_cart_outlined ,
      //           text: "Cart",
      //           onPressed: (){
      //
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) =>  cart()),
      //             );
      //
      //           },
      //
      //         ),
      //
      //
      //         GButton(
      //
      //           icon: Icons.person_outline ,
      //           text: "Profile",
      //           onPressed: (){
      //
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) =>  ProfileApp()),
      //             );
      //
      //           },
      //         ),
      //
      //       ],
      //       selectedIndex: _selectedIndex,
      //       onTabChange: (index) {
      //         setState(() {
      //           _selectedIndex = index;
      //         });
      //       },
      //     ),
      //   ),
      // ),
      body: CartScreen(),

    );
  }

}
