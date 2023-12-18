import 'package:flutter/material.dart';
import 'descriptiontile.dart';

class TeaPage extends StatefulWidget {
  const TeaPage({super.key});

  @override
  State<TeaPage> createState() => _TeaPageState();
}

class _TeaPageState extends State<TeaPage> {
  @override
  Widget build(BuildContext context) {
    return const DescriptionTile(
      coffeeImagePath: 'lib/assets/co2.png', 
      coffeeName: 'Tea', 
      coffeePrice: '2.20', 
      coffeedescription: 'Embrace the serene world of tea at our coffee shop. Sip on our exquisite collection of aromatic teas, carefully selected and brewed to perfection, offering a blissful escape with every sip. Discover tranquility in a teacup.'
      );
  }
}