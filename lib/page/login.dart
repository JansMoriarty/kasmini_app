import 'package:flutter/material.dart';
import 'package:kasmini_app/main_page.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:kasmini_app/page/home.dart';

void main() {
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loginFailed = false;
  bool _showErrorMessage = false;
  bool _isPasswordVisible = false;

  late AnimationController _pageAnimationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller for page transition
    _pageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below
      end: Offset.zero, // Normal position
    ).animate(CurvedAnimation(
      parent: _pageAnimationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0, // Fully transparent
      end: 1.0, // Fully visible
    ).animate(CurvedAnimation(
      parent: _pageAnimationController,
      curve: Curves.easeIn,
    ));

    // Start the page animation
    _pageAnimationController.forward();
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    super.dispose();
  }

  void _attemptLogin() async {
    setState(() {
      _loginFailed = false;
    });

    if (_usernameController.text == '123' &&
        _passwordController.text == '123') {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );

      // Wait for 2 seconds and navigate to HomePage
      await Future.delayed(const Duration(seconds: 2));

      Navigator.of(context).pop(); // Close loading screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      setState(() {
        _loginFailed = true;
        _showErrorMessage = true;
      });

      Timer(const Duration(seconds: 2), () {
        setState(() {
          _showErrorMessage = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(34.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 130),
                    Lottie.asset('assets/lottie/login.json',
                        height: 150, width: 150),
                    const SizedBox(height: 6),
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24)),
                    ),
                    const SizedBox(height: 50.0),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 147, 147, 147),
                              width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 147, 147, 147),
                              width: 2),
                        ),
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Color.fromARGB(255, 105, 105, 105)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 147, 147, 147),
                              width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 147, 147, 147),
                              width: 2),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Color.fromARGB(255, 105, 105, 105)),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(255, 105, 105, 105),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      height: 42,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5755FE),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)),
                        ),
                        onPressed: _attemptLogin,
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
