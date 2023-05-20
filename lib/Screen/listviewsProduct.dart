import 'package:flutter/material.dart';
class ListViewProduct extends StatelessWidget {
    
   ListViewProduct({super.key  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(''))
            ),
          )
        ],
      ),
    );
  }
}