import 'package:flutter/material.dart';



class Blacksmith extends StatelessWidget {
  void startHammering() {
    print('bang bang bang');
  }

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: const Text('Apply Hammer'),
      onPressed: startHammering,
    );
  }
}