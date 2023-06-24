import 'package:coffeehouse_project/CoffeeDescriptions/descriptiontile.dart';
import 'package:flutter/material.dart';


class CappucinoPage extends StatefulWidget {
  const CappucinoPage({super.key});

  @override
  State<CappucinoPage> createState() => _CappucinoPageState();
}

class _CappucinoPageState extends State<CappucinoPage> {
  @override
  Widget build(BuildContext context) {
    return const DescriptionTile(
      coffeeImagePath: 'lib/assets/co4.png', 
      coffeeName: 'Cappucinno', 
      coffeePrice: '4.20', 
      coffeedescription: 'Indulge in the timeless elegance of our signature cappuccinos. Immerse yourself in the harmony of rich espresso, velvety steamed milk, and delicate foam, meticulously crafted to deliver a luxurious and satisfying coffee experience at our coffee shop.'
      );
  }
}
