import 'package:flutter/material.dart';
import 'package:college_aeminities_application/login.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    // Simulate a delay to mimic loading
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isVisible = false;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change background color here
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Image.asset(
            'images/college_logo.png', // Path to your image
            width: 400,
            height: 400,
          ),
        ),
      ),
    );
  }
}
