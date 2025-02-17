import 'package:flutter/material.dart';

import '../components/custom_text_field.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const LoginButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function() toggleView;

  LoginPage({super.key, required this.toggleView});

  void login() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to\nAllou! ✌️',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 100),
            CustomTextField(
              controller: _emailController,
              hintText: 'Type your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Type your password',
              isObscure: true,
            ),
            const SizedBox(height: 20),
            LoginButton(title: 'Login', onTap: login),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => toggleView(),
              child: Text('Register now'),
            ),
          ],
        ),
      ),
    );
  }
}
