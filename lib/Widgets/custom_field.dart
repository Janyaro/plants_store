import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';

class CustomField extends StatelessWidget {
      TextEditingController controller;
    bool onsecure;
    String hintText;
    IconData icondata;
   CustomField({super.key , required this.controller , required this.onsecure , required this.hintText , required this.icondata});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
              controller: controller,
              obscureText: onsecure,
              decoration: InputDecoration(
                prefixIcon: Icon(icondata , color: ConstantsItem.blackColor.withOpacity(.4),),
                hintText: hintText,  
                 
              ),
            );
  }
}