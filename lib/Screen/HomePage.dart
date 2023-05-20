import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/listViewBuilder.dart';
import '../widget/CustomGridViewBuilder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:imtiaz_shoping_app/Provider/select_provider.dart';

class HomePage extends StatelessWidget {
  String? selectedValueOfArea;
  bool? deliveryType;
  HomePage({super.key, this.selectedValueOfArea, this.deliveryType});

  @override
  Widget build(BuildContext context) {
    // final providersss=Provider.of<SelectProvider>(context,);
//  print("Select Area"+providersss.selectedValueOfArea);
    print('Build');
    print(DateTime.now().toString());
    return ChangeNotifierProvider<SelectProvider>(
      create: (context) => SelectProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            'Deliver To',
                            style: TextStyle(fontSize: 2.h, color: Colors.black),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.black)
                        ],
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<SelectProvider>(
                      builder: (context, selectedProvider, child) {
                    return Text(
                      selectedValueOfArea.toString(),
                      style: TextStyle(fontSize: 3.h, color: Colors.black),
                    );
                  }),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 5.h,
                      ),
                      Icon(
                        Icons.question_mark_outlined,
                        color: Colors.black,
                        size: 5.h,
                      ),
                      Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 5.h,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                    child: deliveryType == false
                        ? Text('Express')
                        : Text('Standard')),
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
              ),
              Container(
                height: 6.h,
                color: Color.fromARGB(255, 245, 227, 174),
                child: deliveryType == false
                    ? Text(
                        'Express delivery orders will be delivered on the same day - All orders will recieved after 7PM will be delivered the next day')
                    : Text(
                        'Standard delivery orders will be delivered on the next day - All orders will be delivered between 10AM to 9PM only'),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container
              (
                height: 25.h,
                width: 100.w,
                child: CustomeListViewBuilder()),
                                 
              Container(
                
                  //height: MediaQuery.of(context).size.height,//
                      height: 50.h,
                child: CustomGridViewBuilder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
