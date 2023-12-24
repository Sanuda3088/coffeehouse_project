
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:coffeehouse_project/globals.dart'as globals;
import 'package:flutter/material.dart';

class DescriptionTile extends StatefulWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;
  final String coffeedescription;

  const DescriptionTile({
    Key? key,
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
    required this.coffeedescription,
  }) : super(key: key);

  @override
  State<DescriptionTile> createState() => _DescriptionTileState();
}

class _DescriptionTileState extends State<DescriptionTile> {
  int count = 1;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  void placeOrder() {
    final CollectionReference orders =
        FirebaseFirestore.instance.collection('Orders');
    DateTime now = DateTime.now();

    orders.add({
      'CoffeeName': widget.coffeeName,
      'CoffeePrice': widget.coffeePrice,
      'CoffeeCount': count,
      'CoffeeImagePath': widget.coffeeImagePath,
      'OrderDate': now,
      'Name': globals.userName,
    }).then((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Order Placed'),
          content: const Text('Your order has been placed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }).catchError((error) {
      print('Error placing order: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                height: h * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.coffeeImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height: h * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      widget.coffeeName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('with Almond Milk'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  height: h * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ExpandableText(
                          widget.coffeedescription,
                          expandText: 'more',
                          collapseText: 'less',
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w * 0.3,
                    height: h * 0.14,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Column(
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '\$${widget.coffeePrice}',
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.15,
                    width: w * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 30, bottom: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: placeOrder,
                        child: const Text(
                          'Order',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: w * 0.1,
                    height: h * 0.16,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.orange,
                            onPressed: decrementCount,
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            count.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            color: Colors.orange,
                            onPressed: incrementCount,
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
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
