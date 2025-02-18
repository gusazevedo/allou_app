import 'package:allou_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) async {
    final authService = AuthService();
    await authService.signOut();
    if (!context.mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Tela principal')),
    );
  }
}
