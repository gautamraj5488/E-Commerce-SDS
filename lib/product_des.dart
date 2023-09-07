import 'package:flutter/material.dart';

void main() => runApp(ProductDescriptionApp());

class ProductDescriptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Description',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDescriptionPage(),
    );
  }
}

class ProductDescriptionPage extends StatefulWidget {
  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  double rating = 0.0;
  TextEditingController reviewController = TextEditingController();

  void submitReview() {
    // You can handle the submission of the review here
    final review = reviewController.text;
    print('Rating: $rating, Review: $review');

    // Optionally, you can send the review data to your server or store it locally.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Product Description'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Product Image
            Image.network(
              'https://rukminim2.flixcart.com/image/224/224/k0plpjk0/tripod/monopod/y/h/z/gadget-deals-universal-adjustable-dual-clip-selfie-stick-tripod-original-imafk54tamtgvmn9.jpeg?q=90',
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
            ),

            // Product Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Product Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Product description goes here. You can provide detailed information about the product.',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Product Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '\$9.69',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            Container(
              color: Colors.grey.shade200,
              height:100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent
                    ),
                  ),

                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                    ),
                  ),


                ],
              ),
            ),

            // Rating
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Rating: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  RatingBar(
                    rating: rating,
                    onRatingChanged: (newRating) {
                      setState(() {
                        rating = newRating;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Review Text Field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: reviewController,
                decoration: InputDecoration(
                  hintText: 'Write a review...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),

            // Submit Review Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  submitReview();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Review submitted.'),
                    ),
                  );
                },
                child: Text('Submit Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  final ValueChanged<double> onRatingChanged;

  RatingBar({
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () => onRatingChanged(i.toDouble()),
            child: Icon(
              i <= rating ? Icons.star : Icons.star_border,
              size: 30,
              color: Colors.orange,
            ),
          ),
      ],
    );
  }
}