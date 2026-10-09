import 'package:chat_app/coustom/customButoon.dart';
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:chat_app/ui/onBording/introScreen.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomElevatedButton(
              textWidget: Text("Logout",style: mTextStyle16(mFontWeight: FontWeight.w500,mColor: Colors.white),),
              backgroundColor: AppColors.secondaryColor,
              onPressed: () async {
                /// session out using sharedPreferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(FirebaseRepository.PREPS_USER_ID_KEY, "");
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
              }),
        )
      ],
    ),);
  }
}