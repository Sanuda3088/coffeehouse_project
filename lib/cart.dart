import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 0;
  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
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
      body: Column(
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
                      child: Image.asset('lib/assets/co4.png'),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cappucinno',style: TextStyle(fontSize: 25),),
                          Text('with Almond milk'),
                          Text('\$4.20',style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  //this column is need to place in the corner
                  Container(
                    width: 70,
                    //alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          count.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                        IconButton(
                          color: Colors.orange,
                          onPressed: () {},
                          icon: const Icon(Icons.delete,size: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
