import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';

class Plantfeature extends StatelessWidget {
  String feature;
  String title;
   Plantfeature({super.key , required this.feature , required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(feature , style: TextStyle(color: ConstantsItem.blackColor ) ,),
                    Text(title , style: TextStyle(color: ConstantsItem.primaryColor , fontSize: 18 , fontWeight: FontWeight.bold ) ,)
      
                      ],
                                      ),
    )
;
  }
}