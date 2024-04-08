import 'package:flutter/material.dart';

Widget CustomBox(String title, String imagePath) {
  return Material(
    elevation: 8,
    borderRadius: BorderRadius.circular(10.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(height: 32, width: 32, child: Image.asset(imagePath)),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1E3D8A),
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
