import 'package:flutter/material.dart';

import '../components/custom_text_field.dart';

class RegisterButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const RegisterButton({super.key, required this.title, required this.onTap});

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

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function() toggleView;

  RegisterPage({super.key, required this.toggleView});

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
            const SizedBox(height: 10),
            CustomTextField(
              controller: _confirmPwController,
              hintText: 'Conform your password',
              isObscure: true,
            ),
            const SizedBox(height: 20),
            RegisterButton(
              title: 'Register',
              onTap: () {
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
                print('Confirm Password: ${_confirmPwController.text}');
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => toggleView(),
              child: Text('Already have an account? Login now'),
            ),
          ],
        ),
      ),
    );
  }
}
