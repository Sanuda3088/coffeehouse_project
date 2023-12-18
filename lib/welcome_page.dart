
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login_page.dart';
import 'signup_page.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60,bottom: 60),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: h*0.28,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/istock.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Center(child: Lottie.asset('lib/assets/lottie/WelcomePage_Animation.json'),),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150,55)),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(179, 210, 116, 1)),
                    shape:MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginPage()
                      )  
                    );
                  }, 
                  child: const Text('Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)
                  ),
           
                const SizedBox(width: 20,),
        
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150,55)),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(179, 210, 116, 1)),
                    shape:MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignupPage()
                      )  
                    );
                  }, 
                  child: const Text('Sign Up',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)
                  ),
                  
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black12,
    );
  }
}