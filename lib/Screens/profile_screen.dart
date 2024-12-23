 import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: media.width,
          height: media.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: ConstantsItem.primaryColor.withOpacity(.5)
                  ),
                  shape: BoxShape.circle
                ),
                child:const CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                radius: 80,
                
                ),
              ),
              Column(
                children: [
                   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('John Doe' , style: TextStyle(fontSize: 25 , color: ConstantsItem.blackColor.withOpacity(.8)),),
                 const SizedBox(width: 4,),
                  Image.asset('assets/images/verified.png' , height: 20,)
                ],
              ),
              
              Text('johndoe@gmail.com' , style: TextStyle(fontSize: 15 ,color: ConstantsItem.blackColor.withOpacity(.6)),)
        
                ],
              ),
            const SizedBox(height: 20,),
             ProfileWidget(title: 'My Profile', icons: Icons.person)    ,
             ProfileWidget(title: 'Setting', icons: Icons.settings)    ,
             ProfileWidget(title: 'Notification', icons: Icons.notifications)    ,
             ProfileWidget(title: 'FAQ', icons: Icons.chat)    ,
             ProfileWidget(title: 'Share', icons: Icons.share)    ,
             ProfileWidget(title: 'Logout', icons: Icons.logout)    ,
             
             
                   ],
          ),
        ),
      ),
    );
  }
}