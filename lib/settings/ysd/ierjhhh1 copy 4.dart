import 'package:flutter/material.dart';

class LoginScreenJKBbjkhhHHHh extends StatefulWidget {
  @override
  _LoginScreenJKBbjkhhHHHhState createState() => _LoginScreenJKBbjkhhHHHhState();
}

class _LoginScreenJKBbjkhhHHHhState extends State<LoginScreenJKBbjkhhHHHh> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void loginUser(BuildContext context) {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });

      if (emailController.text.contains("@") && passwordController.text.length > 6) {
        final snackBar = SnackBar(content: Text("Login Successful"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(content: Text("Invalid credentials"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => loginUser(context),
                    child: Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
