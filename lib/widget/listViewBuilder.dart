import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:imtiaz_shoping_app/Screen/Dairy.dart';
import 'package:imtiaz_shoping_app/Screen/Snaks.dart';
import 'package:imtiaz_shoping_app/Screen/Bakery.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:imtiaz_shoping_app/Screen/Bearrages.dart';
import 'package:imtiaz_shoping_app/Screen/Baby_World.dart';
import 'package:imtiaz_shoping_app/Screen/Coffee_&_Tea.dart';
import 'package:imtiaz_shoping_app/Screen/Edible_Grocery.dart';
import 'package:imtiaz_shoping_app/Provider/HomePageProvider.dart';

class CustomeListViewBuilder extends StatelessWidget {
  CustomeListViewBuilder({super.key});
  final homePageProvider = new HomePageProvider();
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => HomePageProvider(),
        child: ListView.builder(
            itemCount: homePageProvider.nameList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  homePageProvider.myindexs(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => index == 0
                              ? Bakery()
                              : index == 1
                                  ? Snaks()
                                  : index == 2
                                      ? Bearrages()
                                      : index == 3
                                          ? TeaAndCoffee()
                                          : index == 4
                                              ? EdibleGrocery()
                                              : index == 5
                                                  ? Dairy()
                                                  : BabyWorld()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage(
                                  homePageProvider.nameList[index].image),
                              fit: BoxFit.cover),
                        ),
                        height: 12.h,
                        width: 12.h,
                        // child: Image.asset(homePageProvider.nameList[index].image)
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('${homePageProvider.nameList[index].name}'),
                      // Text('${homePageProvider.nameList[index].color}'),
                      // Text('${homePageProvider.nameList[index].image}'),
                    ],
                  ),
                ),
              );
            }));
  }
}
