import 'package:flutter/material.dart';
import 'cart_item.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPaymentMethod = 'Credit Card';
  String shippingAddress = '';

  bool showBillSplit = false;

  @override
  Widget build(BuildContext context) {
    double totalBill = 0.0;
    for (var item in widget.cartItems) {
      totalBill += (item.discountedPrice * item.quantity);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Shipping Address',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            onChanged: (value) {
              setState(() {
                shippingAddress = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Enter your shipping address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          DropdownButton<String>(
            value: selectedPaymentMethod,
            onChanged: (String? newValue) {
              setState(() {
                selectedPaymentMethod = newValue!;
              });
            },
            items: <String>['Credit Card', 'PayPal', 'Cash on Delivery']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Bill: ₹${totalBill.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showBillSplit = !showBillSplit;
                  });
                },
                child: Icon(
                  showBillSplit ? Icons.expand_less : Icons.expand_more,
                  size: 32.0,
                ),
              ),
            ],
          ),
          if (showBillSplit)
            Column(
              children: widget.cartItems.map((item) {
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(
                      'Price: ₹${item.discountedPrice.toStringAsFixed(2)} x ${item.quantity}'),
                  trailing: Text(
                    '₹${(item.discountedPrice * item.quantity).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ElevatedButton(
            onPressed: () {
              // Implement checkout functionality
            },
            child: Text('Place Order'),
          ),
        ],
      ),
    );
  }
}
