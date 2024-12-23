import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';

class OnboardingPage extends StatelessWidget {
  String image;
  String title;
  String description;
   OnboardingPage({super.key , required this.image , required this.title , required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 50 , right: 50 , bottom: 80),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset(image),
                ),
                const SizedBox(height: 10,),
              Text(
                textAlign: TextAlign.center,
                title ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: ConstantsItem.primaryColor
                  
                ),
                
                ),
                SizedBox(height: 10,),
                              Text(
                textAlign: TextAlign.center,
                description ,
                 style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  
                  
                ),
                
                ),
              ],
            ),
          );
  }
}