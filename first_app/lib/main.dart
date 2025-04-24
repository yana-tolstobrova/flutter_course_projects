import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradiantContainer([
          Color.fromARGB(255, 57, 15, 116),
          Color.fromARGB(255, 21, 102, 169)
        ]),
      ),
    ),
  );
}
