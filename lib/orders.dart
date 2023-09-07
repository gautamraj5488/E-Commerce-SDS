import 'package:flutter/material.dart';

import 'order1page.dart';

void main() {
  runApp(OrderSearchApp());
}

class OrderSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order Search'),
        ),
        body: OrderSearchPage(),
      ),
    );
  }
}

class OrderSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your orders here',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Implement search functionality here
                },
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5.0),
                    Text('Search Orders'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  OrderDetailsApp()),
              );

            },
            child: OrderListItem(
              productName: 'boAt STONE 1208 14 W Bluetooth Speaker.',
              productImage: 'https://rukminim1.flixcart.com/image/xif0q/speaker/mobile-tablet-speaker/u/a/s/stone-1208-boat-original-imaghtghuzqaf2rw.jpeg?q=80',
              productDetails: ['Color: Purple'],
              productPrice: '₹4028',
              deliveryStatus: 'Delivered on Aug 21',
              orderStatus: 'Your item has been delivered',
            ),
          ),
          OrderListItem(
            productName: 'XP Pen Star G640 6 x 4 inch Graphics Tablet',
            productImage: 'https://rukminim1.flixcart.com/image/k1nw9zk0/graphics-tablet/z/2/d/star-medium-yes-g640-xp-pen-original-imafh6ugwywwhcaj.jpeg?q=80',
            productDetails: ['Color: Black',],
            productPrice: '₹2704',
            deliveryStatus: 'Delivered on Aug 25',
            orderStatus: 'Your item has been delivered',
          ),
          // Add more OrderListItem widgets for additional orders
        ],
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final String productName;
  final String productImage;
  final List<String> productDetails;
  final String productPrice;
  final String deliveryStatus;
  final String orderStatus;

  OrderListItem({
    required this.productName,
    required this.productImage,
    required this.productDetails,
    required this.productPrice,
    required this.deliveryStatus,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement navigation to order details page here
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Container(
              width: 75.0,
              height: 75.0,
              child: Image.network(productImage, fit: BoxFit.cover),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: productDetails.map((detail) {
                      return Text(detail);
                    }).toList(),
                  ),
                  Text(
                    'Price: $productPrice',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    deliveryStatus,
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    orderStatus,
                    style: TextStyle(fontSize: 12.0),
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
