import 'package:flutter/material.dart';
class EdibleGrocery extends StatefulWidget {
  const EdibleGrocery({super.key});

  @override
  State<EdibleGrocery> createState() => _EdibleGroceryState();
}

class _EdibleGroceryState extends State<EdibleGrocery> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.teal,  
        title: Text('Edible Grocery'),
      ),
body: Column(

  children: [
      ],
),

    );
  }
}