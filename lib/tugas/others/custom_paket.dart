import 'package:flutter/material.dart';

class CustomPaket extends StatelessWidget {
  final String paket;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const CustomPaket({
    super.key,
    required this.paket,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: RadioListTile<String>(
        title: Text(paket),
        value: paket,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
