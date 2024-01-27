import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopswift/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignUpScreen(),
    );
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 170,
                  height: 170,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A7FCA),
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField('Username', Icons.person, false, _userNameController),
                buildTextField('Email', Icons.email, false, _emailController),
                buildTextField('Password', Icons.lock, true, _passwordController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFF5BA41), // Background color
                    onPrimary: Colors.white, // Text Color (Foreground color)
                  ),
                  child: const Text('Sign Up'),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: const Text('I have an account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, bool isPasswordType, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Please fill in all fields');
      return;
    }

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        // User creation successful, navigate to the home screen
        Navigator.pushNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred during sign up'; // Default error message

      // Customize the error message based on the error code
      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already in use';
          break;
        case 'invalid-email':
          message = 'This is not a valid email address';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled';
          break;
        case 'weak-password':
          message = 'The password is too weak';
          break;
      }

      _showErrorDialog(message);
    } catch (e) {
      // Handle any other errors
      _showErrorDialog('An unexpected error occurred. Please try again.');
    }
  }
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
              },
            ),
          ],
        );
      },
    );
  }


}
