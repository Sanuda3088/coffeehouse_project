import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeehouse_project/checkout_page.dart';
import 'package:flutter/material.dart';

class PaymentGatewayPage extends StatefulWidget {
  final List<DocumentSnapshot> orders;
  final double totalOrderValue;

  const PaymentGatewayPage({
    required this.orders,
    required this.totalOrderValue,
  });

  @override
  _PaymentGatewayPageState createState() => _PaymentGatewayPageState();
}

class _PaymentGatewayPageState extends State<PaymentGatewayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Order Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.orders.length,
              itemBuilder: (context, index) {
                final order = widget.orders[index];
                final coffeeName = order['CoffeeName'] as String? ?? '';
                final coffeeCount = order['CoffeeCount'] as int? ?? 0;
                final coffeePrice = order['CoffeePrice'] as String? ?? '';

                return ListTile(
                  title: Text('$coffeeName x $coffeeCount'),
                  subtitle: Text('Price: \$$coffeePrice'),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Order Value: \$${widget.totalOrderValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    totalBill: widget.totalOrderValue,
                  ),
                ),
              );
            },
            child: const Text('Proceed to Payment',style: TextStyle(fontSize: 18),),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
