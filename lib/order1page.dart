import 'package:flutter/material.dart';

import 'orders.dart';

void main() {
  runApp(OrderDetailsApp());
}

class OrderDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: OrderDetailsScreen(),
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  OrderSearchApp()),
            );

          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Order ID - OD226393009776617000'),
            ),
            ListTile(
              title: Text('Product: XP Pen Star G640 6 x 4 inch Graphics Tablet'),
              subtitle: Text('Medium, Black'),
            ),
            ListTile(
              title: Text('Seller: XPPEN'),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Price Details'),
                  ),
                  ListTile(
                    title: Text('List price: ₹5,999'),
                  ),
                  ListTile(
                    title: Text('Selling price: ₹3,199'),
                  ),
                  ListTile(
                    title: Text('Extra Discount: - ₹500'),
                  ),
                  ListTile(
                    title: Text('Special Price: ₹2,699'),
                  ),
                  ListTile(
                    title: Text('Handling Fee: ₹5'),
                  ),
                  ListTile(
                    title: Text('Shipping fee: ₹40'),
                  ),
                  ListTile(
                    title: Text('Shipping discount: - ₹40'),
                  ),
                  ListTile(
                    title: Text('Total Amount: ₹2,704'),
                  ),
                ],
              ),
            ),

            ListTile(
              title: Text('Order Confirmed'),
              subtitle: Text('Oct 30, 2022'),
            ),
            ListTile(
              title: Text('Delivered'),
              subtitle: Text('Nov 06, 2022'),
            ),
          ],
        ),
      ),
    );
  }
}
