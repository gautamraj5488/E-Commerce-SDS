import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdsfinal/homepage.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String? selectedSex; // Nullable type for sex dropdown

  DateTime selectedDate = DateTime.now(); // Initial date for the calendar view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.01,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create an Account',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
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
                    Icon(Icons.person_outline , color: Colors.grey,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name'

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
                    Icon(Icons.email_outlined , color: Colors.grey,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email'

                        ),
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
                            hintText: 'Confirm Password'

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




              Row(
                children: [
                  Text(
                    'Sex:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String?>(
                    value: selectedSex,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSex = newValue;
                      });
                    },
                    items: <String?>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String?>>((String? value) {
                      return DropdownMenuItem<String?>(
                        value: value,
                        child: Text(value ?? ''),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Date of Birth:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
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
                    Icon(Icons.phone_android_outlined , color: Colors.grey,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number'

                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),



                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
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
