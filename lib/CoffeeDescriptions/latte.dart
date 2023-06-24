import 'package:flutter/src/widgets/framework.dart';
import 'descriptiontile.dart';

class LattePage extends StatefulWidget {
  const LattePage({super.key});

  @override
  State<LattePage> createState() => _LattePageState();
}

class _LattePageState extends State<LattePage> {
  @override
  Widget build(BuildContext context) {
    return const DescriptionTile(
      coffeeImagePath: 'lib/assets/co1.png', 
      coffeeName: 'Latte', 
      coffeePrice: '3.20', 
      coffeedescription: 'Experience the artistry of our handcrafted lattes. Indulge in the perfect harmony of espresso and velvety steamed milk, expertly crafted to create a creamy and smooth texture, topped with latte art for a visually stunning and deliciously satisfying sip.'
      );
  }
}