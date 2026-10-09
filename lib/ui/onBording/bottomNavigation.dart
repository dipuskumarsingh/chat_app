

import 'package:chat_app/ui/homeScreen.dart';
import 'package:chat_app/ui/profileScreen.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contactScreen.dart';

class bottomNavigation extends StatefulWidget{
  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectedIndex = 0;

  List<Widget> screenNavigation = [
    HomeScreen(),
    ContactScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenNavigation [selectedIndex],
      bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              selectedIcon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_filled,color: Colors.white,),
                  Text("Home",style: mTextStyle16(mColor: Colors.white),)
                ],
              ),
                icon: Icon(Icons.home_outlined), label: ""),
            NavigationDestination(
                selectedIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Colors.white),
                    Text("New Chat",style: mTextStyle16(mColor: Colors.white),)
                  ],
                ),
                icon: Icon(Icons.add_outlined), label: ""),
            NavigationDestination(
                selectedIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person,color: Colors.white),
                    Text("Profile",style: mTextStyle16(mColor: Colors.white,mFontWeight: FontWeight.w500),)
                  ],
                ),
                icon: Icon(Icons.person_2_outlined), label: ""),
          ],
        backgroundColor: Colors.white,
        indicatorColor: AppColors.secondaryColor,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value){
            selectedIndex = value;
          setState(() {

          });
        },
      ),
    );
  }
}

