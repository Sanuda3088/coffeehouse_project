import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final double totalBill;

  const CheckoutPage({super.key, required this.totalBill});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPaymentType = 'Visa';

  TextEditingController addressController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Your payment was successful.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the checkout page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Delivery Address:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                hintText: 'Enter your address...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Allow up to 3 lines for address
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Payment Method Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              controller: expirationDateController,
              decoration: const InputDecoration(labelText: 'Expiration Date'),
            ),
            TextField(
              controller: cvvController,
              decoration: const InputDecoration(labelText: 'CVV'),
            ),
            const SizedBox(height: 15,),
            Text(
              'Total Bill: \$${widget.totalBill.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                // Simulate a successful payment
                // You can replace this with your actual payment processing logic

                // Show the payment success dialog
                _showPaymentSuccessDialog();
              },
              child: const Text(
                'Pay Now',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


