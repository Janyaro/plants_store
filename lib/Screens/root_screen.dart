import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantsapp/Model/plants.dart';
import 'package:plantsapp/Screens/Auth_Screens/login_screen.dart';
import 'package:plantsapp/Screens/cart_screen.dart';
import 'package:plantsapp/Screens/favourate_screen.dart';
import 'package:plantsapp/Screens/home_screen.dart';
import 'package:plantsapp/Screens/page_screen.dart';
import 'package:plantsapp/Screens/profile_screen.dart';
import 'package:plantsapp/Screens/scan_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
   List<Plant> myfavorite = [];
   List<Plant> mycart = [];
   List<Widget> wigdetOption (){
    return [
    HomeScreen(),
    FavourateScreen( favoriteplants: myfavorite,),
    CartScreen( addtoCartPlants: mycart,),
    ProfileScreen()
   ];
   } 
  int bottomNavIndex = 0;
  List<String> pageTitle = [
    'Home',
    'Favourite',
    'Cart',
    'User'
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pageTitle[bottomNavIndex], ),
         const Icon(Icons.notifications_none)
        ],
        )),
      
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      
      body: IndexedStack(
        index: bottomNavIndex,
        children: wigdetOption(),
      ),
      
      floatingActionButton: FloatingActionButton(
        shape:const CircleBorder(),
        backgroundColor: Colors.green.shade800,
  onPressed: () {
    Navigator.push(
      context,
      PageTransition(
        child:const  ScanScreen(),
        type: PageTransitionType.bottomToTop,
      ),
      
    );
    
  },
  child: Image.asset('assets/images/code-scan-two.png', height: 30,),
),
floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
bottomNavigationBar: AnimatedBottomNavigationBar(
  icons: [Icons.home , Icons.favorite_outline , Icons.card_travel , Icons.person],
  activeColor: Colors.green,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.white,
        activeIndex: bottomNavIndex,
        onTap: (int index) {
          setState(() {
            bottomNavIndex = index;
            List<Plant> favouriteplants = Plant.getFavoritedPlants();
            
            List<Plant> addtoCartPlants = Plant.addedToCartPlants();
            myfavorite = favouriteplants;
            mycart = addtoCartPlants.toSet().toList();
          });
        },
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,

));
  }
}