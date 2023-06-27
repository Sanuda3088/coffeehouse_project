import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('Orders');

  Future<void> delete(String ordersId) async {
    await orders.doc(ordersId).delete();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Canceled'),
        content: const Text('Your order has been canceled successfully.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: orders.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  final String coffeeName =
                      documentSnapshot['CoffeeName'] ?? '';
                  final String coffeePrice =
                      documentSnapshot['CoffeePrice'] ?? '';
                  final int coffeeCount = documentSnapshot['CoffeeCount'] ?? 0;
                  final String coffeeImagePath =
                      documentSnapshot['CoffeeImagePath'] ?? '';

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.black38,
                          height: 120,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 130,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(coffeeImagePath),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        coffeeName,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const Text('with Almond milk'),
                                      Text('\$$coffeePrice',
                                          style: const TextStyle(fontSize: 20))
                                    ],
                                  ),
                                ),
                              ),
                              //this column is need to place in the corner
                              Container(
                                width: 60,
                                //alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      coffeeCount.toString(),
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                    IconButton(
                                      color: Colors.orange,
                                      onPressed: () => delete(documentSnapshot.id),
                                      icon: const Icon(Icons.delete, size: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
