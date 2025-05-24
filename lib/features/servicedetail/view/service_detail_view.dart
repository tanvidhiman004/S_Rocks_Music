
import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String title;

  const ServiceDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'You tapped on: $title',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

