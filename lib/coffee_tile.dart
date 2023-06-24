import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;
  final Function(BuildContext) onImageTap;
  final Function(BuildContext) onAddTap;

  const CoffeeTile({
    super.key,
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
    required this.onImageTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 5.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black54,
        ),
        child: Column(
          children: [
            // Coffee image
            GestureDetector(
              onTap: () {
                onImageTap(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(coffeeImagePath),
              ),
            ),

            // Coffee name
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'With Almond Milk',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            // Coffee price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$coffeePrice'),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.orange,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          onAddTap(context);
                        },
                        child: const Icon(Icons.add)),
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
