import 'package:flutter/material.dart';

class ClinicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العيادات'),
        backgroundColor: const Color(0xFF015951),
      ),
      body: const Center(
        child: const Text('صفحة العيادات'),
      ),
    );
  }
}
