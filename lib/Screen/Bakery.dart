import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:imtiaz_shoping_app/Provider/HomePageProvider.dart';

class Bakery extends StatelessWidget {
  Bakery({super.key});
  final homePageProvider = new HomePageProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bakery')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: homePageProvider.nameList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                homePageProvider.nameList[index].image),
                            radius: 5.h,
                          ),
                          trailing: Text('${index+1}'),
                          title: Text(homePageProvider.nameList[index].name),
                        ),
                      ),
                      SizedBox(height: 2.h,)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
