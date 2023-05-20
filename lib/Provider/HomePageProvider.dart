import '../Model/ShopingMall.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomePageProvider with ChangeNotifier{
List<ShoppingMall>_nameList=[
  ShoppingMall(name: 'Bakery', image: 'asset/Bakery.jpeg',color: Color.fromARGB(255, 255, 236, 205),gridImage: 'asset/grid/colaNext.jpeg',gridName: 'Cola Next'),
  ShoppingMall(name: '    Snaks & \nConfectonary', image: 'asset/Snaks.jpeg',color: Colors.orange.shade100,gridImage: 'asset/grid/faulad.jpeg',gridName: 'Sharbat e faulad'),
  ShoppingMall(name: 'Baerrages', image: 'asset/drinks.jpeg',color: Colors.red.shade400,gridImage: 'asset/grid/honey.jpeg',gridName: 'Honey'),
  ShoppingMall(name: 'Tea & Coffee', image: 'asset/tea_coffee.jpeg',color: Color.fromARGB(230, 243, 202, 142),gridImage: 'asset/grid/kashmeer.jpeg',gridName: 'Kashmir Cooking oil'),
  ShoppingMall(name: 'Edible Grocery', image: 'asset/grocery.jpeg',color: Colors.white,gridImage: 'asset/grid/medicam.jpeg',gridName: 'Medicam'),
  ShoppingMall(name: 'Dairy', image: 'asset/dairy.jpeg',color: Color.fromARGB(255, 4, 185, 167),gridImage: 'asset/grid/rooh.jpeg',gridName: 'Rooh Afzah'),
  ShoppingMall(name: 'Baby World', image: 'asset/baby_world.jpeg',color: Colors.pink.shade300,gridImage: 'asset/grid/shifa.jpeg',gridName: 'Shifa Masala'),
  ];
List<ShoppingMall> get nameList=>_nameList;


@override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
  int _myIndex=0;
  int get myindex=>_myIndex;

  void myindexs(value){
    _myIndex=value;
  }
}