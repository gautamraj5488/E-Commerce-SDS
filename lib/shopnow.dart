import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sdsfinal/product_des.dart';
import 'package:sdsfinal/profile.dart';
import 'package:sdsfinal/shopnow_categories.dart';


import 'cartpage.dart';
import 'helping strings/categories.dart';
import 'homepage.dart';

class shopnow extends StatefulWidget {
  const shopnow({super.key});

  @override
  State<shopnow> createState() => _shopnowState();
}

class _shopnowState extends State<shopnow> {

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade200,



      appBar: AppBar(

        actions: [



          IconButton(
            icon:Icon(Icons.search) , onPressed: () {  },
          ),

          IconButton(
            icon:Icon(Icons.mic_none_outlined) , onPressed: () {  },
          ),

          IconButton(
           icon:Icon(Icons.camera_alt_outlined) , onPressed: () {  },
          ),





          IconButton(
            icon:Icon(Icons.shopping_cart_outlined) , onPressed: () {  },
          ),







        ],
        // leading: Icon(Icons.arrow_back , size: 36,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homepage()),
                );
              }
        ),
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: const Text("Products", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 26 ,color: Colors.black),),
      ),

        bottomNavigationBar:Container(

          margin: EdgeInsets.all(12),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(36)),
            color: Colors.blueAccent.shade100,
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2,vertical: 12),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              backgroundColor: Colors.transparent,
              // backgroundColor: Colors.blueAccent.shade100,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.black,
              padding: EdgeInsets.all(12),
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home ,
                  text: "Home",
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  homepage()),
                    );

                  },

                ),
                GButton(

                    icon: Icons.shopping_bag_outlined ,
                    text: "Shop Now",
                ),

                GButton(

                    icon: Icons.shopping_cart_outlined ,
                    text: "Cart",
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  CartScreen()),
                    );

                  },
                ),


                GButton(

                    icon: Icons.person_outline ,
                    text: "Profile",
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ProfileScreen()),
                    );

                  },
                ),

              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(

                itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2
                  ),
                    itemBuilder: (context ,index){
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [



                        InkWell(
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProductDescriptionApp()),
                            );

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.5,

                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    opacity: 1,
                                    // fit: BoxFit.cover,
                                    image: NetworkImage(
                                      categories_image[index],
                                    )
                                ),

                              // border: Border.all(color: Colors.grey.shade300, width: 2),
                              // borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , topRight: Radius.circular(12) ,bottomRight:Radius.circular(12) ,bottomLeft: Radius.circular(12)  )
                              borderRadius: BorderRadius.all(Radius.circular(12))
                            ),

                                margin: EdgeInsets.all(1),
                                child: Align(
                                alignment: Alignment.topRight,
                                    child: Row(

                                    children: [

                                        SizedBox(
                                        width: MediaQuery.of(context).size.width*0.3
                                        ),
                                        // IconButton(
                                        // onPressed: (){},
                                        // icon: Icon(Icons.favorite_border_outlined, color: Colors.red,)
                                        //
                                        // )

                                    ],
                                    ),
                                )



                                ),
                        ),
                        Container(
                          padding:  EdgeInsets.all(1),
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),

                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.5,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300.withOpacity(0.7),
                                    border: Border.all(color: Colors.grey.shade300, width: 2),
                                    // border: Border.all(color: Colors.blueGrey),
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                                child: Text(categories_writeup[index] , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w600),),
                            ),
                          ),
                          ),
                        ),


                        Container(
                          width: 200,
                          height: 60,

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),


                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(categories_writeup[index] , style: TextStyle( fontWeight: FontWeight.w600 , fontSize: 16) ,),
                                  Text('50/-'),
                                  Row(
                                    children: [
                                      Icon(Icons.star_border,size: 12,color: Colors.black,),
                                      Icon(Icons.star_border,size: 12,color: Colors.black,),
                                      Icon(Icons.star_border,size: 12,color: Colors.black,),
                                      Icon(Icons.star_border,size: 12,color: Colors.black,),
                                      Row(
                                        children: [
                                          Icon(Icons.star_border,size: 12,color: Colors.black,),
                                          SizedBox(width: 12,),

                                          Row(
                                            children: [
                                              Icon(Icons.delivery_dining_outlined , size: 10,color: Colors.black,),
                                              Text(categories_del[index],style: TextStyle(fontSize:10, fontWeight: FontWeight.w600),)
                                            ],
                                          )

                                        ],
                                      ),
                                    ],
                                  )

                                ],
                              ),
                              SizedBox(width: 12,),
                              // Column(
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Icon(Icons.delivery_dining_outlined , size: 16,color: Colors.black,),
                              //         Text(categories_del[index],style: TextStyle(fontSize:12, fontWeight: FontWeight.w600),)
                              //       ],
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ],
                    );
                    }
    ),
            ),
          ),
        ],
      )
    );
  }
}


