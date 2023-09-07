import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:sdsfinal/auth/phone.dart';



import '../homepage.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // toolbarHeight: MediaQuery.of(context).size.height*(0.01),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded ,color: Colors.black,),
        ),
      ),

      body: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child:  Stack(
              //     alignment: Alignment.center,
              //     children: [
              //       Container(
              //         height: MediaQuery.of(context).size.height*0.035,
              //         width: MediaQuery.of(context).size.width*0.135,
              //         decoration: BoxDecoration(color: Colors.black.withOpacity(0.15) , borderRadius: BorderRadius.all (Radius.circular(20))),
              //       ),
              //       Text("Skip" ,style:TextStyle(color: Colors.black.withOpacity(0.45), fontSize: 14,fontWeight: FontWeight.w600))
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              Container(
                alignment: Alignment.center,
                child: Text('Phone Verification',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
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
                alignment: Alignment.center,
                child: Text('Enter the OTP to continue',
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
              Pinput(
                // defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : 'Pin is incorrect';
                // },
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
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
                  child: Text('Verify OTP' ,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w700),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      )
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(onPressed: (){


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyPhone()),
                    );


                  }, child: Text(
                    'Edit Phone Number ?',
                    style: TextStyle(color: Colors.black),

                  )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
