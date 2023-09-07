import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdsfinal/profile.dart';
import 'package:sdsfinal/setting.dart';
import 'package:sdsfinal/shopnow.dart';


import 'dart:async';
import 'cart.dart';
import 'helping strings/categories.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late final PageController pageController1;
  late final PageController pageController2;
  int pageNo1 =0;
  int pageNo2 =0;

  Timer? carasoulTimer;

  Timer getTimer(){
    return Timer.periodic( const Duration(seconds: 2), (timer) {

      if(pageNo1==8){
        pageNo1=0;
      }
      pageController1.animateToPage(
          pageNo1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut);
      pageNo1++;


      if(pageNo2==8){
        pageNo2=0;
      }
      pageController2.animateToPage(
          pageNo2,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut);
      pageNo2++;


    });

  }


  @override
  void initState() {

    pageController1 = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    pageController2 = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    carasoulTimer = getTimer();
    super.initState();
  }
  @override
  void dispose() {
    pageController1.dispose();
    pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    // var currentIndex=1;
    // var bottonnavbar_item=[
    //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    //    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Shop Now"),
    //    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Cart"),
    //    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
    // ];

    return Scaffold(

      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 200,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.blue.shade500,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://www.stickitup.xyz/cdn/shop/products/BACKGROUND-1_dfbcde70-0092-4652-b137-bf581e143d90.jpg?v=1684984202&width=720"),
                    radius: MediaQuery.of(context).size.height*0.062,
                    backgroundColor: Colors.blue.shade100,
                  ),
                  
                  Text("Gautam Raj" ,
                    style: TextStyle(
                      fontSize: 24 ,
                      fontWeight: FontWeight.w500,
                      color:Colors.black
                    ),
                  )
                ],
              ),
              
              ),



            ListTile(
              leading: IconButton(
                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ProfileApp()),
                  );

                },
                icon: Icon(Icons.person_outline),

              ),

                  // Icons.person_outline),
              title: const Text('Profile'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProfileApp()),
                );

              },

            ),


            ListTile(
              leading: IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.shopping_bag_outlined),

              ),
              // leading: Icon(Icons.shopping_bag_outlined),
              title: const Text('Orders'),
              // onTap: (){
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) =>  ProfileApp()),
              //   );
              //
              // },
            ),



            ListTile(
              leading: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SettingsApp()),
                  );

                },
                icon: Icon(Icons.settings),),
              title: const Text('Settings'),

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SettingsApp()),
                );

              },
            ),

            ListTile(
              leading: IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.star_border),),
              title: const Text('Rate us'),
              // onTap: (){
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) =>  SettingsApp()),
              //   );
              //
              // },
            ),



            ListTile(

              leading: IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.logout_rounded),),
              title: const Text('Log Out'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        elevation: 0,
        title: Text("StickU" , style: TextStyle( fontSize: 32 , fontWeight: FontWeight.bold , fontStyle: FontStyle.normal),)
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
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  shopnow()),
                      );

                    },
                  ),

                  GButton(

                      icon: Icons.shopping_cart_outlined ,
                      text: "Cart",
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  cart()),
                      );

                    },

                  ),


                  GButton(

                      icon: Icons.person_outline ,
                      text: "Profile",
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ProfileApp()),
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



      // backgroundColor: Color(0xFFF5D6BA),
      backgroundColor: Color(0xFFECF6FE),


      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Column(
                    children: [
                      SizedBox(height: 200,),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Welcome",
                        style: GoogleFonts.teko(
                          textStyle:
                          TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D1821)
                          )
                        ),
                        )
                      ),
                      Container(
                          child: Text(
                            "Shop your favorite products here",
                            style: GoogleFonts.lobsterTwo(
                                textStyle:
                                TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0D1821)
                                )
                            ),
                          )
                      ),

                      SizedBox(
                        height: 130,
                      ),

                      OutlinedButton(
                          onPressed: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  shopnow()),
                            );

                          },
                          child: Text(
                            "Shop Now" ,
                            style: GoogleFonts.teko(

                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF6c757d)
                              ),
                            )
                          ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color(0xFF6c757d)
                              ),
                            ),
                      )
                    ],
                  ),
            ),
            SizedBox(height: 190,),
            Container(
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFC1D7CB),
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              width: MediaQuery.of(context).size.width*0.96,

              child: Column(
                children: [
                  Container(
                    child: Align(
                      widthFactor: 2.25,
                      alignment: Alignment.centerLeft,
                      child: Text("Categories" , style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (index) =>
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black , width: 1, style: BorderStyle.solid ),
                                image: DecorationImage(
                                  opacity: 0.2,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    categories_image[index],
                                  )
                                ),
                                // image: Image.network(categories_image[index]),
                                  // color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              height: 100,
                              width: 100,

                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(12),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                              fontSize: 10.5 ,
                              fontWeight: FontWeight.bold ,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

      ],
    ),
    )
                            ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Column(
              children: [
                Text("Top Products", style: TextStyle( fontSize: 22 , fontWeight: FontWeight.bold , fontStyle: FontStyle.normal),),
                SizedBox(

                  height: 200,
                  child: PageView.builder(
                    controller: pageController1 ,
                    onPageChanged: (index){
                      pageNo1 = index;
                      setState(() {

                      });
                    },
                    itemBuilder: (_,index){
                      return AnimatedBuilder(animation: pageController1, builder: (ctx ,child){
                        return child!;

                      },
                        child: GestureDetector(

                          onTap: (){
                            // TODO : something you can

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Hello you tapped at ${index + 1}"),
                              ),
                            );
                          },
                          onPanDown:(d){
                            carasoulTimer?.cancel();
                            carasoulTimer = null;
                          },
                          onPanCancel: (){
                            carasoulTimer = getTimer();
                          },
                          child: Container(

                            margin: EdgeInsets.all(12),
                            height: 200,

                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    opacity: 1,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      categories_image[index],
                                    )
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12))

                            ),


                          ),
                        ) ,
                      );
                    },
                    itemCount: 8,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(8,
                        (index) => GestureDetector(

                      child: Container(
                        margin: EdgeInsets.all(2.0),
                        child: Icon(Icons.circle, size: 12.0,
                          color: pageNo1 == index
                              ? Colors.blueAccent
                              : Color(0xFFCCCECA),
                        ),),
                    ),),),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Column(
              children: [
                Text("Recently Viewed", style: TextStyle( fontSize: 22 , fontWeight: FontWeight.bold , fontStyle: FontStyle.normal),),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController2 ,
                    onPageChanged: (index){
                      pageNo2 = index;
                      setState(() {

                      });
                    },
                    itemBuilder: (_,index){
                      return AnimatedBuilder(animation: pageController2, builder: (ctx ,child){
                        return child!;

                      },
                        child: GestureDetector(

                          onTap: (){
                            // TODO : something you can

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Hello you tapped at ${index + 1}"),
                              ),
                            );
                          },
                          onPanDown:(d){
                            carasoulTimer?.cancel();
                            carasoulTimer = null;
                          },
                          onPanCancel: (){
                            carasoulTimer = getTimer();
                          },
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 200,

                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    opacity: 1,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      categories_image[index],
                                    )
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12))

                            ),

                          ),
                        ) ,
                      );
                    },
                    itemCount: 8,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(8,
                        (index) => GestureDetector(

                      child: Container(
                        margin: EdgeInsets.all(2.0),
                        child: Icon(Icons.circle, size: 12.0,
                          color: pageNo2 == index
                              ? Colors.blueAccent
                              : Color(0xFFCCCECA),
                        ),),
                    ),),),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),

            // GridView.builder(
            //   shrinkWrap: true,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 1,
            //         mainAxisExtent: MediaQuery.of(context).size.height*0.1
            //     ),
            //     itemBuilder: (context ,index){
            //       return Card(
            //
            //         child: ListTile(
            //           onTap: (){},
            //           leading: Icon(Icons.person),
            //           title: Text("User Name" ,style: TextStyle(
            //               fontWeight: FontWeight.bold
            //           ),),
            //         ),
            //
            //       );
            //
            //     }
            // ),



          ],
        ),
      ),
    );
  }

}
