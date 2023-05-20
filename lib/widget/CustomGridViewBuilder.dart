import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:imtiaz_shoping_app/Screen/GridProductDetails.dart';
import 'package:imtiaz_shoping_app/Provider/HomePageProvider.dart';

class CustomGridViewBuilder extends StatelessWidget {
  CustomGridViewBuilder({super.key});
  final homePageProvider = new HomePageProvider();

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => HomePageProvider(),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10),
            itemCount: homePageProvider.nameList.length,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                child: InkWell(
                  onTap: () {
                    homePageProvider.myindexs(index+1);
                    print("new test ${homePageProvider.myindex}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GridProductDetails(
                                gridImage:
                                    homePageProvider.nameList[index].gridImage,
                                gridName: homePageProvider
                                    .nameList[index].gridName)));
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    homePageProvider.nameList[index].gridImage),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Color.fromARGB(255, 11, 190, 235),
                                    ),
                                    height: 6.h,
                                    // width: 27.h,
                                    // width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            '${homePageProvider.nameList[index].gridName}'),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
