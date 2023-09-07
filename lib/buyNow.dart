import 'package:flutter/material.dart';

class PlaceOrderPage extends StatefulWidget {
  @override
  _PlaceOrderPageState createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  // Variables to store selected address, payment option, and new address
  String selectedAddress = '';
  String selectedPaymentOption = '';
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController newAddressController = TextEditingController(); // Added

  // Sample data for delivery addresses and payment options
  List<String> deliveryAddresses = ['Address 1', 'Address 2', 'Address 3'];
  List<String> paymentOptions = ['Credit Card', 'Debit Card', 'Cash on Delivery'];

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed.
    cardNumberController.dispose();
    cardExpiryController.dispose();
    newAddressController.dispose(); // Added
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Delivery Address Selection
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select Delivery Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: deliveryAddresses.length,
                itemBuilder: (context, index) {
                  final address = deliveryAddresses[index];
                  return ListTile(
                    title: Text(address),
                    leading: Radio(
                      value: address,
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value.toString();
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // Add New Address Option
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Add New Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: newAddressController,
                decoration: InputDecoration(labelText: 'New Address'),
              ),
            ),
            Divider(),

            // Payment Options
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select Payment Option:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: paymentOptions.length,
                itemBuilder: (context, index) {
                  final paymentOption = paymentOptions[index];
                  return ListTile(
                    title: Text(paymentOption),
                    leading: Radio(
                      value: paymentOption,
                      groupValue: selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentOption = value.toString();
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // Card Details (if Debit Card is selected)
            if (selectedPaymentOption == 'Debit Card') ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Enter Card Details:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(labelText: 'Card Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: cardExpiryController,
                  decoration: InputDecoration(labelText: 'Card Expiry (MM/YY)'),
                ),
              ),
              Divider(),
            ],

            // Place Order Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to place the order
                  // You can add your order processing logic here.
                  // After placing the order, return to the previous page.
                  Navigator.pop(context);
                },
                child: Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
