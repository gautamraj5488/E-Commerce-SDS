

import 'package:flutter/material.dart';

class DashBoard_Box extends StatelessWidget {
  final IconData icon;
  final String title;

  const DashBoard_Box( {
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 12,top: 12,right: 12,bottom: 12),

      child: Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.all(12),
        // height: MediaQuery.of(context).size.height*0.2,
        // width: MediaQuery.of(context).size.width*0.4,
        // decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.2),
        //         blurRadius: 1.0,
        //         offset: Offset(0.0, 5.0),
        //       ),
        //     ],
        //   border: Border.all(color: Colors.black ,width: 2)
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon , size: 100,),
            Text(title ,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );



  }
}

