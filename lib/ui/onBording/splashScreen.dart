
import 'dart:async';

import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:chat_app/ui/onBording/introScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNavigation.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userToken = await prefs.getString(FirebaseRepository.PREPS_USER_ID_KEY);
      Widget NavigationTo = IntroScreen();
      if(userToken !=null && userToken != ""){
        NavigationTo = bottomNavigation();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationTo));

    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/Red and Black Modern Chat Logo (1).png",width: 300,),
      ),
    );
  }
}