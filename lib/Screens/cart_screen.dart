import 'package:flutter/material.dart';
import 'package:plantsapp/ConstantText.dart';
import 'package:plantsapp/Model/plants.dart';

class CartScreen extends StatefulWidget {
  List<Plant> addtoCartPlants;
   CartScreen({super.key , required this.addtoCartPlants});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  widget.addtoCartPlants.isEmpty ? Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/add-cart.png' , height: 100, ),
          const SizedBox(height: 10,),
          Text('your Favorite plants' , style: TextStyle(fontSize: 20 , color: ConstantsItem.primaryColor.withOpacity(.8)),)
        ],
      ),
    ) : Container(
      child:Column(
        children: [
             Expanded(
               child: ListView.builder(
                itemCount: widget.addtoCartPlants.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context , index){
                  return Container(
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
                              child: Image.asset(widget.addtoCartPlants[index].imageURL),
                            )),
                            Positioned(
                              bottom: 5,
                              
                              left: 80,
                              child: Column(
                                children: [
                                  Text(widget.addtoCartPlants[index].category),
                                  Text(widget.addtoCartPlants[index].plantName , style: TextStyle(
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
                          child: Text(r'$'+ widget.addtoCartPlants[index].price.toString() , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: ConstantsItem.primaryColor),),
                        )
                  
                      ],
                    ),
                  );
                }),
             ),
        Divider(
          thickness: 2,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price' , style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold , color: ConstantsItem.primaryColor),) , 
              Text(r'$22' ,  style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold , color: ConstantsItem.primaryColor),)
            ],
          ) ,
        )
        ],
      )      
    );
  }
}