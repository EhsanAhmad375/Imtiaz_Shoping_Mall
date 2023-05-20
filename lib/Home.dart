import 'package:flutter/material.dart';
import 'Provider/select_provider.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:imtiaz_shoping_app/Screen/HomePage.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  String? choosValue;
  List<String> areaList = [
    'Askari 1',
    'Askari 2',
    'Askari 3',
    'BahadurAbad',
    'Baloch Pull',
    'Bangalore Town',
    'Clifton town',
    'Central Lane',
    'Commertial Area DHA phase',
    'Dawod City'
  ];
  @override
  Widget build(BuildContext context) {
    print('Build');
    print(DateTime.now().millisecond.toString());
    return ChangeNotifierProvider<SelectProvider>(
      create: (context) => SelectProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('asset/Imtiaz.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Select your order type',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<SelectProvider>(
                      builder: (context, selectProvider, child) {
                        return Expanded(
                          child: InkWell(
                            onTap: selectProvider.isExpressed
                                ? null
                                : selectProvider.Expressed,
                            child: Container(
                              height: 50,
                              color: selectProvider.isExpressed
                                  ? Colors.grey.shade300
                                  : null,
                              child: Center(child: Text('Express')),
                            ),
                          ),
                        );
                      },
                    ),
                    Consumer<SelectProvider>(
                      builder: (context, selectProvider, child) {
                        return Expanded(
                          child: InkWell(
                            onTap: selectProvider.isStandard
                                ? null
                                : selectProvider.Standard,
                            child: Container(
                              height: 50,
                              color: selectProvider.isStandard
                                  ? Colors.grey.shade300
                                  : null,
                              child: Center(child: Text('Standard')),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please select your location',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                Consumer<SelectProvider>(
                    builder: (context, selectedProvider, child) {
                  return DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "Karachi",
                      "Lahore (Disabled)",
                      "Larkana (Disable)",
                      'HyderAbad (Disable)'
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: "Select your City",
                      ),
                    ),
                    onChanged: (value) {
                      selectedProvider.selectedValueCitys(value.toString());

                      print(selectedProvider.selectedValueCity);
                    },
                    // selectedItem: "Karachi",
                  );
                }),
                SizedBox(
                  height: 30,
                ),
                Consumer<SelectProvider>(
                    builder: (context, selectedProvider, child) {
                  return DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: areaList,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: "Select your Area",
                      ),
                    ),
                    onChanged: (value) {
                      selectedProvider.selectedValuesOfArea(value.toString());

                      print(selectedProvider.selectedValueOfArea);
                    },
                    // selectedItem: "Karachi",
                  );
                }),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<SelectProvider>(
                        builder: (context,selectedProvider,child) {
                          return MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            height: 7.h,
                            color: Color.fromARGB(255, 242, 186, 19),
                            onPressed: () {
                            if(selectedProvider.selectedValueCity =='' || selectedProvider.selectedValueOfArea==''){
                              return null;
                            }  
                          else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage(selectedValueOfArea: selectedProvider.selectedValueOfArea,deliveryType:selectedProvider.isStandard ,)),
                              );
                          }
                            },
                            child: Text('Confirem'),
                          );
                        }
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color.fromARGB(255, 242, 186, 19),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 7.h,
                            onPressed: () {
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,
                                    color: Color.fromARGB(255, 242, 186, 19)),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Text(
                                  'Location on Map',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 242, 186, 19)),
                                ),
                              ],
                            
                          
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
