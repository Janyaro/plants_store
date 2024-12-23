import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Model/plants.dart';
import 'package:plantsapp/Widgets/plantFeature.dart';

class DetailScreen extends StatefulWidget {
  int plantId ;
 DetailScreen({super.key , required this.plantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Plant> plantList = Plant.plantList;
  bool toogleIsFavourite(bool isFavorated){
    return !isFavorated;
  }
  bool toogleIsSelected(bool isSelect){
    return !isSelect;
  }
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
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
                  borderRadius: BorderRadius.circular(20),
                  color: ConstantsItem.primaryColor.withOpacity(.15)
                ),
              child:Icon(Icons.close) ,
              ),
            ),
             InkWell(
              onTap: (){
                setState(() {
                bool isFavourite = toogleIsFavourite(
                  plantList[widget.plantId].isFavorated);
                plantList[widget.plantId].isFavorated = isFavourite;
                });
              },
               child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConstantsItem.primaryColor.withOpacity(.15)
                ),
                           child:Icon(
                           plantList[widget.plantId].isFavorated ==true ? 
                            
                           Icons.favorite 
                           :
                           Icons.favorite_border ,
                            color: ConstantsItem.primaryColor.withOpacity(.8),) ,
                           ),
             )
          ],),
      ),
      body:Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 250,
              child: Image.asset(plantList[widget.plantId].imageURL),
            )),
          Positioned(
              top: 10,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Plantfeature(feature: 'Size', title: plantList[widget.plantId].size,),
                Plantfeature(feature: 'Humidity', title:  plantList[widget.plantId].humidity.toString(),),
                Plantfeature(feature: 'Temprature', title:  plantList[widget.plantId].temperature,),
                
                ],
            )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:const EdgeInsets.only(top: 20 , left: 30 , right: 30 ),
                height: media.height * .5,
              width: media.width,
              decoration: BoxDecoration(
                color: ConstantsItem.primaryColor.withOpacity(0.4),
                borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(plantList[widget.plantId].plantName , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: ConstantsItem.primaryColor),),
                          Text(r'$'+plantList[widget.plantId].price.toString() , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold , color: ConstantsItem.blackColor),)
                        ],
                      ),
                    Row(
                      children: [
                        Text(plantList[widget.plantId].rating.toString() , style: TextStyle(fontSize: 30 , color: ConstantsItem.primaryColor , fontWeight: FontWeight.bold ),),
                        Icon(Icons.star , color: ConstantsItem.primaryColor, size: 30,)
                      ]
                      ,
                    )
                    ],
                  ),
                const SizedBox(height: 5,),
                Expanded(
                  child:Text(plantList[widget.plantId].decription ,
                  textAlign: TextAlign.justify,
                   style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: ConstantsItem.blackColor.withOpacity(.7)
                  
                  ),) 
                )
                ],
              ),
            )),
          
        ],
      ),
      floatingActionButton: SizedBox(
        width: media.width * .9,
        height: 50,
        child: Row(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                bool isSelect = toogleIsSelected(plantList[widget.plantId].isSelected);
                plantList[widget.plantId].isSelected = isSelect; 
                  
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: plantList[widget.plantId].isSelected == true ? ConstantsItem.primaryColor : Colors.white, 
                borderRadius: BorderRadius.circular(50)
                
                )
                 ,
                 child: Icon(Icons.shopify_rounded , size: 30, color:plantList[widget.plantId].isSelected == true ? Colors.white : ConstantsItem.primaryColor ),
              ),
            ),
           const SizedBox(width: 20,),
           Expanded(child: Container(
            decoration: BoxDecoration(
              color: ConstantsItem.primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset( 0, 1),
                  blurRadius: 5,
                  color: ConstantsItem.primaryColor.withOpacity(.3)
                ),
                
              ]

            ),
            child:const Center(
              child: Text('Buy Now' , style: TextStyle(color: Colors.white , fontSize: 20),),
            ),
           ))
          ],
        ),
      ),
    );
  }
}