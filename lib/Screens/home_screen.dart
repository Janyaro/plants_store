import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Model/plants.dart';
import 'package:plantsapp/Screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex =0;
  //
  bool toogleIsFavourite(bool isFavourite){
    return !isFavourite;
  }
  List<Plant> plantList = Plant.plantList;
  List<String > plantType = [
    'Recommend ',
    'Indoor',
    'OutDoor',
    'Garden',
    'supplement'
  ];
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color:ConstantsItem.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   Container(
                    width: size.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                     child: Row(
                      children: [
                        Icon(Icons.search , color: ConstantsItem.blackColor.withOpacity(0.6),),
                        const Expanded(
                          child: TextField(
                            showCursor: false, 
                            decoration: InputDecoration(
                              hintText: 'Search plants' ,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              
                               ),) ),
                               Icon(Icons.mic , color: ConstantsItem.blackColor.withOpacity(0.6),)
                      ],
                     ),
                   )
                  ],
                ),
              ),
            Container(
              height: 50,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plantType.length,
                itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Text(plantType[index] ,style: TextStyle(
                      fontSize: 16,
                      fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.w300,
                      color: currentIndex == index ? ConstantsItem.primaryColor : ConstantsItem.blackColor
                    ),)),
                );
              }),
            ),
          SizedBox(
            height: size.height * .4,
            child: ListView.builder(
              itemCount: plantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(child: DetailScreen(plantId: plantList[index].plantId), type: PageTransitionType.bottomToTop));
                },
                child: Container(
                width: 200,
                margin:const EdgeInsets.symmetric(horizontal: 10),
                             decoration: BoxDecoration(
                color: ConstantsItem.primaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20)
                             ),
                child: Stack(
                  children: [
                  Positioned(
                    top: 15,
                    right: 20,
                    child: Container(
                      height: 30 , 
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ), 
                      child: IconButton(
                        onPressed: (){
                          plantList[index].isFavorated;                        }, 
                        icon:Icon(plantList[index].isFavorated ==true ? Icons.favorite_border : Icons.favorite_border , color: ConstantsItem.primaryColor.withOpacity(.8),) ,iconSize: 16,),)
                        ),
                        Positioned(
                          top: 50,
                          bottom: 50,
                          left: 50,
                          right: 50 ,
                          child: Image.asset(plantList[index].imageURL)),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              children: [
                                Text(plantList[index].category , style:const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18
                                ),),
                                Text(plantList[index].plantName , style:const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15
                                ),),
                              ],
                            )),
                            Positioned(
                              bottom: 15,
                            right: 20,
                              child: Container(
                                padding:const EdgeInsets.symmetric(horizontal: 10 , vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                
                              ),
                        child: Text(r'$'+ plantList[index].price.toString() , style: TextStyle(color: ConstantsItem.primaryColor , fontSize: 16),)))
                  ],
                ),
                             ),
              );
            }),
          ),
          Container(
            padding:const EdgeInsets.only(top: 10 , left: 20 , bottom: 10),
            child:const Text('News Plants' , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20 ),),
          ),
           Container(
            height: size.height * .5,
            child: ListView.builder(
              itemCount: plantList.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index){
                return InkWell(
                  onTap: (){
                  Navigator.push(context, PageTransition(child: DetailScreen(plantId: plantList[index].plantId), type: PageTransitionType.bottomToTop));
                },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ConstantsItem.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    padding:const EdgeInsets.only(left: 10 , top: 10),
                    margin:const EdgeInsets.only(top: 10 , bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: ConstantsItem.primaryColor.withOpacity(.8),
                                shape: BoxShape.circle
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 0,
                              left: 0,
                              child: SizedBox(
                              height: 80,
                              child: Image.asset(plantList[index].imageURL),
                            )),
                            Positioned(
                              bottom: 5,
                              
                              left: 80,
                              child: Column(
                                children: [
                                  Text(plantList[index].category),
                                  Text(plantList[index].plantName , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: ConstantsItem.blackColor
                                  ),)
                                ],
                              )),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(r'$'+ plantList[index].price.toString() , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: ConstantsItem.primaryColor),),
                        )
                  
                      ],
                    ),
                  ),
                );
              }),
          )
            ],
          ),
        ),
      )
    );
  }
}
