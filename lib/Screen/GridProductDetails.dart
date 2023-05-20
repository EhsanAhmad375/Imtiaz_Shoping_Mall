import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class GridProductDetails extends StatelessWidget {
  String gridImage;
  String gridName;
   GridProductDetails({super.key,required this.gridImage,required this.gridName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 190, 235),

        title: Text('$gridName'),
      ),
      body: Column(children: [
        Container(
          height: 40.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(gridImage),
            fit: BoxFit.cover
            ),
          
          ),
          
        ),

        Text('Details'),
      ]),
    );
  }
}