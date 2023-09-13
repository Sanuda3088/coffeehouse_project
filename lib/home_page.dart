import 'package:coffeehouse_project/CoffeeDescriptions/tea.dart';
import 'package:coffeehouse_project/CoffeeDescriptions/black.dart';
import 'package:coffeehouse_project/CoffeeDescriptions/cappucino.dart';
import 'package:coffeehouse_project/CoffeeDescriptions/latte.dart';
import 'package:coffeehouse_project/abooutus_page.dart';
import 'package:coffeehouse_project/article_tile.dart';
import 'package:coffeehouse_project/cart.dart';
import 'package:coffeehouse_project/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'coffee_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CartPage(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart_rounded))
        ],
        flexibleSpace: Container(
          color: Colors.grey.shade900,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 85, 58, 48)),
                child: Row(
                  children: [
                    Icon(Icons.person_3),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Coffee house',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
             ListTile(
              title: const Text(
                'about Us',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Log Out',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () async {
                await auth.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Find The Best Coffee \nFor You",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    suffix: GestureDetector(
                      onTap: () {
                        showSearch(
                            context: context, delegate: CustomSearchdelegate());
                      },
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.orange,
                      ),
                    ),
                    hintText: '   Search here...',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              Expanded(
                  child: SizedBox(
                height: h * 0.4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CoffeeTile(
                      coffeeImagePath: 'lib/assets/co4.png',
                      coffeeName: 'Cappucino',
                      coffeePrice: '4.20',
                      onImageTap: (context) {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const CappucinoPage()));
                      },
                      onAddTap: (context) {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const CartPage(cartImagePath: 'lib/assets/co4.png', cartName: 'Cappucino', cartPrice: '4.20')));
                      */
                      },
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'lib/assets/co1.png',
                      coffeeName: 'Latte',
                      coffeePrice: '3.20',
                      onImageTap: (context) {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const LattePage()));
                      },
                      onAddTap: (context) {},
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'lib/assets/co3.png',
                      coffeeName: 'Black',
                      coffeePrice: '5.20',
                      onImageTap: (context) {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const BlackPage()));
                      },
                      onAddTap: (context) {},
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'lib/assets/co2.png',
                      coffeeName: 'Tea',
                      coffeePrice: '2.20',
                      onImageTap: (context) {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const TeaPage()));
                      },
                      onAddTap: (context) {},
                    ),
                  ],
                ),
              )),
            ]),
            const SizedBox(
              height: 30.0,
            ),
            Row(children: [
              Expanded(
                  child: SizedBox(
                height: h * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ArticleTile(
                        articleImagePath: 'lib/assets/coffee-oldin.png',
                        articleName: 'Coffee Life Benefits', url: 'https://www.rush.edu/news/health-benefits-coffee',),
                    ArticleTile(
                        articleImagePath: 'lib/assets/istock.png',
                        articleName: 'World Coffee day', url: 'https://www.daysoftheyear.com/days/coffee-day/',)
                  ],
                ),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

class CustomSearchdelegate extends SearchDelegate {
  List<String> searchTerms = ['Cappucinno', 'Black', 'Tea', 'Latte'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var coffee in searchTerms) {
      if (coffee.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(coffee);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var coffee in searchTerms) {
      if (coffee.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(coffee);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
