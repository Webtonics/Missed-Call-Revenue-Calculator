import 'package:flutter/material.dart';
import 'package:missed_call_roi_calculator/features/RoICalc/constants/spacings.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.title, required this.controller, required this.message});
  final String title;
  final String message;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        
        children: [
         
          Tooltip(
            message: message,
            child: Text("$title❓", style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),)),
          textspacing,
          TextFormField(controller: controller, decoration: const InputDecoration(
            filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12)))
          ),)
        ],
      ),
    );
  }
}