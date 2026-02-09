import 'package:flutter/material.dart';
import 'package:flutter_deep_link_handler/navigation/app_navigator.dart';
import 'package:flutter_deep_link_handler/widgets/deep_link_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeepLinkHandler(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Deep Link Demo Home'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              const Text(
                'Test Navigation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  AppNavigator.pushNamed('/profile');
                },
                child: const Text('Go to Profile (Normal Nav)'),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  AppNavigator.pushNamed(
                    '/profile',
                    args: {'id': '10'},
                  );
                },
                child: const Text('Go to Profile with ID = 10'),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  AppNavigator.pushNamed(
                    '/product',
                    args: {'id': '99'},
                  );
                },
                child: const Text('Go to Product (ID = 99)'),
              ),

              const Divider(height: 40),

              const Text(
                'Deep Link Examples (Use from adb / browser)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              const Text('myapp://profile'),
              const Text('myapp://profile?id=10'),
              const Text('myapp://product/99'),

              const Spacer(),

              const Center(
                child: Text(
                  'Deep Link Handler: Advanced Demo',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
