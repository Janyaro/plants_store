import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Screens/Auth_Screens/login_screen.dart';
import 'package:plantsapp/Widgets/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pagecontroller = PageController();
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
       actions: [
        Padding(padding: EdgeInsets.all(20) , 
        child: InkWell(
        onTap: () => null,  
          child:const Text('Skip')),)
       ],
       
      ),
      body: Stack(
        children: [
          PageView(
               onPageChanged: (int page){
          setState(() {
            currentpage = page;
          });
          
               },
               controller: pagecontroller,
               children: [
         OnboardingPage(
                     image:'assets/images/plant-one.png',
                     title: ConstantsItem.titleOne, 
                     description: ConstantsItem.descriptionOne),
                     OnboardingPage(
                     image:'assets/images/plant-two.png',
                     title: ConstantsItem.titleTwo, 
                     description: ConstantsItem.descriptionTwo),
                     OnboardingPage(
                     image:'assets/images/plant-three.png',
                     title: ConstantsItem.titleTwo, 
                     description: ConstantsItem.descriptionThree), 

               ],
          ),

        Positioned(
          bottom: 10,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(50)
              ),
              child: IconButton(onPressed: (){
                if(currentpage < 2){
                  print(currentpage);
                pagecontroller.nextPage(duration:const Duration(microseconds: 200), curve: Curves.ease);
              
                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              }, icon: Icon(Icons.arrow_forward_ios_rounded , color: Colors.white,)),
            )
          ],
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Smooth Page Indicator
                  SmoothPageIndicator(
                    controller: pagecontroller,
                    count: 3,
                    effect: WormEffect(
                      dotColor: Colors.grey,
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: ConstantsItem.primaryColor
                    ),
                     // Choose a nice effect
                  ),]))),

        ],
      ),
    );
  }
}
