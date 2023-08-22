import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Column(
        children: [
          SizedBox(
            child: Image(image: AssetImage('lib/assets/cofh.png'),fit: BoxFit.fill,),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Coffee House!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'At Coffee House, we are passionate about providing the finest quality coffee and creating memorable experiences for our customers.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Mission:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'To offer a diverse selection of premium coffee beans sourced from around the world, expertly roasted to perfection, and served with a smile in a warm and inviting atmosphere.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Visit Us:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '123 Coffee Street, City, Country\n\n'
                  'Open Hours:\n'
                  'Monday - Friday: 7:00 AM - 9:00 PM\n'
                  'Saturday - Sunday: 8:00 AM - 10:00 PM',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


