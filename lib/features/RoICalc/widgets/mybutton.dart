import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: const Size(150, 60)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),),
    );
  }
}