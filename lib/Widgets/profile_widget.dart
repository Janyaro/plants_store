import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';

class ProfileWidget extends StatelessWidget {
  IconData icons;
  String title;
   ProfileWidget({super.key , required this.title , required this.icons});

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding:const EdgeInsets.symmetric(horizontal: 10 , vertical:4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icons ,  color: ConstantsItem.blackColor.withOpacity(.7)) , 
                     const SizedBox(width: 20,),
                      Text(title , style: TextStyle(fontSize: 20 , color: ConstantsItem.blackColor.withOpacity(.7) , fontWeight: FontWeight.bold),)
                    ],
                  ),
                const  Icon(Icons.arrow_forward_ios_sharp , size: 18,)
                ],
              ),
            )
           ;
  }
}