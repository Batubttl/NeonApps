import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yeni_neonapps/Firebase/Storage/login_screen.dart';
import 'package:yeni_neonapps/Firebase/Storage/verify_email_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Future<void> _register(BuildContext context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyEmailScreen(),
        ));
  } 
  catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Failed to Register : $e')));
  }
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Jungle App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add spacing above the text
              const NormalSizedbox(),
              // Style and position the text
              const Text(
                'Sign Up to Jungle App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              // Add spacing below the text
              const MediumSizedBox(),
              // Email TextField
              Center(
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fillColor: fieldColor,
                    filled: true,
                    hintText: 'E-mail',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const MediumSizedBox(),
              // Password TextField
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  fillColor: fieldColor,
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const NormalSizedbox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Have you registered before ? ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )),
                ],
              ),
              const NormalSizedbox(),
              ElevatedButton(
                  onPressed: () => _register(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class NormalSizedbox extends StatelessWidget {
  const NormalSizedbox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class MediumSizedBox extends StatelessWidget {
  const MediumSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
    );
  }
}
