import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  Editor({this.controller, this.label, this.tip, this.icon});

  final TextEditingController controller;
  final IconData icon;
  final String label;
  final String tip;

  @override
  Widget build(BuildContext context) {
    return TextField(
              decoration: InputDecoration(
                labelText: label,
                hintText: tip,
                icon: Icon(icon)
              ),
              keyboardType: TextInputType.number,
              controller: controller,
            );
  }
}