import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    final media= MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ConstantsItem.primaryColor.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(Icons.close),
              ),
            ),
              InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ConstantsItem.primaryColor.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(Icons.share),
              ),
            )
            
          ],
        )
      ),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
            width: media.width *.8,
            height: media.height * .8,
            padding: EdgeInsets.all(20),
            child: Center(
              child:Column(
                children: [
                  Image.asset('assets/images/code-scan.png' , height: 100,),
                  SizedBox(height: 20,),
                  Text('Tap to Scan' , style: TextStyle(fontSize: 20 , color: ConstantsItem.primaryColor , fontWeight: FontWeight.w800),)
                ],
              ) ,)
          ))
        ],
      ),
    );
  }
}