import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Screens/Auth_Screens/forget_password.dart';
import 'package:plantsapp/Screens/Auth_Screens/sign_out.dart';
import 'package:plantsapp/Screens/onboarding_screen.dart';
import 'package:plantsapp/Screens/root_screen.dart';
import 'package:plantsapp/Widgets/custom_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Sign In' ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w500),),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Image.asset('assets/images/signin.png'),
              const SizedBox(height: 10,),
            CustomField( 
              controller: emailController,
              onsecure: false,
              hintText: 'Email Address',
              icondata: Icons.email,
            ),
           const SizedBox(height: 10,),
            CustomField( 
              controller: passController,
              onsecure: true,
              hintText: 'password',
              icondata: Icons.password,
            ),
           const SizedBox(height: 10,),
            InkWell(
              onTap: (){
            Navigator.push(context, PageTransition(child:const RootScreen(), type: PageTransitionType.bottomToTop));
              },
              child: Container(
              width: media.width,
              height: media.height * 0.08,
                decoration: BoxDecoration(
                  color: ConstantsItem.primaryColor,
                   borderRadius: BorderRadius.circular(10)
                ),
                child:const Center(
                  child: Text('Sign In' , style: TextStyle(color: Colors.white , fontSize: 18 ),),
                ),
              ),
            ),
           const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, PageTransition(child:const forgetPassword(), type: PageTransitionType.bottomToTop));
              },
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      
                     const TextSpan(
                        text: 'Forget Password ! ',
                        style: TextStyle(
                           fontSize: 16
                        )
                        ),
                        TextSpan(
                          text: 'Reset Here',
                          style: TextStyle(color: ConstantsItem.primaryColor , fontSize: 18)
                        )
                    ]
                    )
                ),
              ),
            ),
           const SizedBox(height: 10,),
           const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('OR' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Divider())
              ],
            ),
           const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              width: media.width,
              height: media.height * 0.09,
              decoration: BoxDecoration(
                border: Border.all(color: ConstantsItem.blackColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Image.asset('assets/images/google.png'),
                Text('Sign In With google' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 , color: ConstantsItem.blackColor.withOpacity(.8)),)
                ],
              ),
            ),
            const SizedBox(height: 6,),
          InkWell(
            onTap: (){
              Navigator.push(context, PageTransition(child:const createUser(), type: PageTransitionType.bottomToTop));
            },
            child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      
                    const  TextSpan(
                        text: 'New on Planty ',
                        style: TextStyle(
                           fontSize: 16
                        )
                        ),
                        TextSpan(
                          text: 'Register Here',
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

