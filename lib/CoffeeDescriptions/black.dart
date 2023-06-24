import 'package:flutter/src/widgets/framework.dart';


import 'descriptiontile.dart';

class BlackPage extends StatefulWidget {
  const BlackPage({super.key});

  @override
  State<BlackPage> createState() => _BlackPageState();
}

class _BlackPageState extends State<BlackPage> {
  @override
  Widget build(BuildContext context) {
    return const DescriptionTile(
      coffeeImagePath: 'lib/assets/co3.png', 
      coffeeName: 'Black', 
      coffeePrice: '5.20', 
      coffeedescription: 'Indulge in the simplicity and purity of our black coffee. Brewed with precision using the finest beans, it delivers a bold and robust flavor profile that awakens your senses, offering an authentic and unadulterated coffee experience.'
      );
  }
}