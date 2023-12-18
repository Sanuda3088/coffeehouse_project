import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeehouse_project/globals.dart';
import 'package:coffeehouse_project/payment_page.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('Orders');

  double calculateTotalOrderValue(List<DocumentSnapshot> orders) {
    double totalValue = 0;
    for (var order in orders) {
      final coffeePrice = order['CoffeePrice'] as String? ?? '';
      final coffeeCount = order['CoffeeCount'] as int? ?? 0;
      final double price = double.tryParse(coffeePrice) ?? 0;
      totalValue += price * coffeeCount;
    }
    return totalValue;
  }

  Future<void> delete(String orderId) async {
    await orders.doc(orderId).delete();
    showDeleteDialog();
  }

  void showDeleteDialog() {
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

  void navigateToPaymentGateway(
      List<DocumentSnapshot> orders, double totalOrderValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentGatewayPage(
          orders: orders,
          totalOrderValue: totalOrderValue,
        ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: orders
            .where("Name", isEqualTo: userName)
            .orderBy("OrderDate")
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!streamSnapshot.hasData) {
            return const Center(
              child: Text('No orders found.'),
            );
          }
          final ordersData = streamSnapshot.data!;
          return ListView.builder(
            itemCount: ordersData.size,
            itemBuilder: (context, index) {
              final documentSnapshot = ordersData.docs[index];
              final coffeeName =
                  documentSnapshot['CoffeeName'] as String? ?? '';
              final coffeePrice =
                  documentSnapshot['CoffeePrice'] as String? ?? '';
              final coffeeCount =
                  documentSnapshot['CoffeeCount'] as int? ?? 0;
              final coffeeImagePath =
                  documentSnapshot['CoffeeImagePath'] as String? ?? '';

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
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    coffeeName,
                                    style:
                                        const TextStyle(fontSize: 25),
                                  ),
                                  const Text('with Almond milk'),
                                  Text('\$$coffeePrice',
                                      style: const TextStyle(
                                          fontSize: 20))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  coffeeCount.toString(),
                                  style: const TextStyle(
                                      fontSize: 22),
                                ),
                                IconButton(
                                  color: Colors.orange,
                                  onPressed: () =>
                                      delete(documentSnapshot.id),
                                  icon: const Icon(Icons.delete,
                                      size: 30),
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
        },
      ),
      floatingActionButton: StreamBuilder<QuerySnapshot>(
        stream: orders
            .where("Name", isEqualTo: globals.userName)
            .orderBy("OrderDate")
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const FloatingActionButton(
              onPressed: null, // Disable the button during loading
              backgroundColor: Colors.orange,
              child: Icon(Icons.check_outlined),
            );
          }
          final ordersData = streamSnapshot.data!;
          final totalOrderValue = calculateTotalOrderValue(ordersData.docs);

          return FloatingActionButton(
            onPressed: () {
              navigateToPaymentGateway(ordersData.docs, totalOrderValue);
            },
            backgroundColor: Colors.orange,
            child: const Icon(Icons.check_outlined),
          );
        },
      ),
    );
  }
}
