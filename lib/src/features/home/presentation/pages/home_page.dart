import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/features/home/presentation/components/custom_button.dart';
import 'package:jwan_test/src/features/home/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to GetX Clean Architecture!'),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Click me!',
              onPressed: () {
                // Handle button click
                log('Button clicked!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
