import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdsfinal/auth/sign_up.dart';

import '../homepage.dart';
import 'otp.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {

  TextEditingController countrycode=TextEditingController();
  @override
  void initState() {
    countrycode.text="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*(0.01),
      ),

      body: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child:  Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.035,
                      width: MediaQuery.of(context).size.width*0.185,
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.15) , borderRadius: BorderRadius.all (Radius.circular(20))),
                    ),
                    // Text("Sign Up" ,style:TextStyle(color: Colors.black.withOpacity(0.45), fontSize: 14,fontWeight: FontWeight.w600))
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MySignUp())
                          );
                        },
                        child: Text("Sign Up" , style:TextStyle(color: Colors.black.withOpacity(0.45), fontSize: 14,fontWeight: FontWeight.w600)) )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text('Sign In',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                  // style: TextStyle(
                  //     fontSize: 40,fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text('Enter your E-mail to get started',
                  // style: TextStyle(fontSize: 16),
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border:Border.all(width: 1 ,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.email_outlined , color: Colors.grey,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email@gmail.com'

                        ),
                        keyboardType: TextInputType.emailAddress,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border:Border.all(width: 1 ,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.password , color: Colors.grey,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password'

                        ),
                        obscureText: true,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    Icon(Icons.remove_red_eye , color: Colors.grey,),
                    SizedBox(width: 10,),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => homepage())
                    );
                  },
                  child: Text('Login' ,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w700 , fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
