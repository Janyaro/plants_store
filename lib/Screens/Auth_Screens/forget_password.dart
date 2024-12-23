
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Screens/onboarding_screen.dart';
import 'package:plantsapp/Widgets/custom_field.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Forget Password' ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w500),),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Image.asset('assets/images/reset-password.png'),
              const SizedBox(height: 10,),
            CustomField( 
              controller: emailController,
              onsecure: false,
              hintText: 'Email Address',
              icondata: Icons.email,
            ),
          
           const SizedBox(height: 10,),
            InkWell(
              onTap: (){
            Navigator.push(context, PageTransition(child:const OnboardingScreen(), type: PageTransitionType.bottomToTop));
              },
              child: Container(
              width: media.width,
              height: media.height * 0.08,
                decoration: BoxDecoration(
                  color: ConstantsItem.primaryColor,
                   borderRadius: BorderRadius.circular(10)
                ),
                child:const Center(
                  child: Text('Reset Password' , style: TextStyle(color: Colors.white , fontSize: 18 ),),
                ),
              ),
            ),
           const SizedBox(height: 10,),
            
            const SizedBox(height: 6,),
          InkWell(
            onTap: (){},
            child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      
                    const  TextSpan(
                        text: 'Have an Account ',
                        style: TextStyle(
                           fontSize: 16
                        )
                        ),
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(color: ConstantsItem.primaryColor , fontSize: 18)
                        )
                    ]
                    )
                ),),
          ),
           const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}

