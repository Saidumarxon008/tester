import 'package:flutter/material.dart';

class Wire extends StatefulWidget {
  const Wire({super.key, required this.initialPosition, required this.todoOffset});
final Offset initialPosition;
final Offset todoOffset;
  @override
  State<Wire> createState() => _WireState();
}

class _WireState extends State<Wire> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
