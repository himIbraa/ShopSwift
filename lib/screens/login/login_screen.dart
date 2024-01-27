import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopswift/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    buildSocial('Login with Facebook', Icons.facebook),
                    buildSocial('Login with Google', Icons.circle),
                    const SizedBox(height: 10),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A7FCA),
                      ),
                    ),
                    const SizedBox(height: 0),
                    const Text(
                      'Continue with email',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                        'Email', Icons.email, false, _emailController),
                    buildTextField(
                        'Password', Icons.lock, true, _passwordController),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                const Text(
                  'By creating an account, you agree to our Terms of Service and Privacy Policy.',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed:_signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5BA41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'LogIn',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, bool isPasswordType,
      TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black87.withOpacity(0.9)),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black87,
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid),
          ),
        ),
        keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
      ),
    );
  }

  Widget buildSocial(String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: () {
          // Social login logic here
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          minimumSize: const Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Please fill in all fields');
      return;
    }

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        // Login successful, navigate to the home screen
        Navigator.pushNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      String message = 'Invalid email or password'; // Default error message

      // Customize the error message based on the error code if needed
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = 'Invalid email or password';
      } else if (e.code == 'network-request-failed') {
        message = 'Network error, please try again later.';
      }

      _showErrorDialog(message);
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
