import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'cartpage.dart';
import 'homepage.dart';

void main() => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Gautam Raj';
  String email = 'gautam_r@ce.iitr.ac.in';
  String mobile = '+91 6206895546';

  void updateProfile(String newName, String newEmail, String newMobile) {
    setState(() {
      name = newName;
      email = newEmail;
      mobile = newMobile;
    });
  }
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
      body: ProfileBody(
        name: name,
        email: email,
        mobile: mobile,
        onUpdateProfile: updateProfile,
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final String name;
  final String email;
  final String mobile;
  final Function(String, String, String) onUpdateProfile;

  ProfileBody({
    required this.name,
    required this.email,
    required this.mobile,
    required this.onUpdateProfile,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        CircleAvatar(

          minRadius: 80.0,
          maxRadius: 120,
          backgroundImage: NetworkImage('https://www.stickitup.xyz/cdn/shop/products/BACKGROUND-1_dfbcde70-0092-4652-b137-bf581e143d90.jpg?v=1684984202&width=720'), // Replace with your profile image
        ),
        SizedBox(height: 16.0),
        Text(
          name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          email,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Mobile: $mobile',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 16.0),
        ListTile(
          title: Text('Edit Profile'),
          trailing: Icon(Icons.edit),
          onTap: () {
            // Navigate to the edit profile screen and pass user data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(
                  name: name,
                  email: email,
                  mobile: mobile,
                  onUpdateProfile: onUpdateProfile,
                ),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('My Orders'),
          trailing: Icon(Icons.check_box),
          onTap: () {
            // Add navigation to the change password screen here
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
          },
        ),
        Divider(),
        ListTile(
          title: Text('Log Out'),
          trailing: Icon(Icons.exit_to_app),
          onTap: () {
            // Add a log out action here
          },
        ),
      ],
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;
  final Function(String, String, String) onUpdateProfile;

  EditProfileScreen({
    required this.name,
    required this.email,
    required this.mobile,
    required this.onUpdateProfile,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  void saveProfile() {
    // Save the updated profile information and pass it back to the profile screen
    widget.onUpdateProfile(
      nameController.text,
      emailController.text,
      mobileController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // This is the screen where users can edit their profile
    // You can create form fields and add functionality to update the user's information
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController..text = widget.name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController..text = widget.email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: mobileController..text = widget.mobile,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
