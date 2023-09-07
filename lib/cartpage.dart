import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sdsfinal/profile.dart';
import 'package:sdsfinal/shopnow.dart';

import 'cart.dart';
import 'cart_item.dart';
import 'checkout.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: CartScreen(),
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'GADGET DEALS Universal Adjustable Dual Clip Mobile Holder',
      price: 499.0,
      discountedPrice: 149.0,
      imagePath:
      'https://www.stickitup.xyz/cdn/shop/products/1_9cfdfc9f-7dfb-4e1f-86d1-4d2f5705fdfb.jpg?v=1687352396&width=720',
    ),
    CartItem(
      name: 'Example Item 2',
      price: 299.0,
      discountedPrice: 199.0,
      imagePath:
      'https://rukminim2.flixcart.com/image/224/224/k0plpjk0/tripod/monopod/y/h/z/gadget-deals-universal-adjustable-dual-clip-selfie-stick-tripod-original-imafk54tamtgvmn9.jpeg?q=90',
    ),
    // Add more items as needed
  ];

  double total = 0.0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    double newTotal = 0.0;
    for (var item in cartItems) {
      newTotal += (item.discountedPrice * item.quantity);
    }
    setState(() {
      total = newTotal;
    });
  }
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      // bottomNavigationBar: CartSummary(
      //   total: total,
      //   onCheckoutPressed: navigateToCheckout,
      // ),
      appBar: AppBar(
        title: Text('Shopping Cart'),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemCard(
                  cartItem: cartItems[index],
                  onRemove: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                    calculateTotal();
                  },
                  onQuantityChange: () {
                    calculateTotal();
                  },
                );
              },
            ),
          ),
           CartSummary(
           total: total,
            onCheckoutPressed: navigateToCheckout,
          ),
        ],
      ),



    );
  }

  void navigateToCheckout() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CheckoutPage(cartItems: cartItems),
    ));
  }
}

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final VoidCallback onQuantityChange;

  CartItemCard({
    required this.cartItem,
    required this.onRemove,
    required this.onQuantityChange,
  });

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  void incrementQuantity() {
    setState(() {
      widget.cartItem.quantity++;
    });
    widget.onQuantityChange();
  }

  void decrementQuantity() {
    if (widget.cartItem.quantity > 1) {
      setState(() {
        widget.cartItem.quantity--;
      });
      widget.onQuantityChange();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              widget.cartItem.imagePath,
              width: 72.0,
              height: 72.0,
            ),
            title: Text(widget.cartItem.name),
            subtitle:
            Text('₹${widget.cartItem.discountedPrice.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: widget.onRemove,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  '₹${widget.cartItem.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '70% Off',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  decrementQuantity();
                },
              ),
              Text(widget.cartItem.quantity.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  incrementQuantity();
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Implement "Save for later" functionality
                },
                child: Text('Save for later'),
              ),
              TextButton(
                onPressed: () {
                  widget.onRemove();
                },
                child: Text('Remove'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class CartSummary extends StatelessWidget {
  final double total;
  final VoidCallback onCheckoutPressed;

  CartSummary({required this.total, required this.onCheckoutPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ₹${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: onCheckoutPressed,
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
