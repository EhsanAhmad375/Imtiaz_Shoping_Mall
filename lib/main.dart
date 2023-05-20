import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:imtiaz_shoping_app/Provider/select_provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context,orientation,screenType) {
        return 
        
        MultiProvider(
          providers: [
                  ChangeNotifierProvider(create: (_)=>SelectProvider()),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
            
          ),
        );
      }
    );
  }
}