import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list_app/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomeView()) );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child:Center(child: Lottie.asset('assets/animation/splash_screen.json'),)
        ),
        const Text(
          'Develped by Tarek Ahmed',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Kalam'),
        ),
       const SizedBox(height: 10,),
        const Text('Version 1.0.0',style: TextStyle(fontFamily: 'Kalam'),),
        const SizedBox(height: 20,),
      ],
    ));
  }
}
