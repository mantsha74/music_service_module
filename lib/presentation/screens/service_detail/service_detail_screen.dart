import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String title;

  const ServiceDetailScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service Detail")),
      body: Center(
        child: Text("You tapped on $title"),
      ),
    );
  }
}