import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade700, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: const Color(0xFF015951), width: 1.0),
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.transparent,
        ),
        onChanged: (query) {
          // تنفيذ البحث
        },
        style: const TextStyle(color: Color(0xFF015951)),
      ),
    );
  }
}
