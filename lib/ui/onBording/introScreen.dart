import 'package:chat_app/coustom/customButoon.dart';
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:chat_app/ui/onBording/bloc/registerBloc/register_bloc.dart';
import 'package:chat_app/ui/onBording/loginScreen.dart';
import 'package:chat_app/ui/onBording/registerScreeen.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex:3,
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/intoscreenimages.jpg"),
                    SizedBox(height:1),
                    Column(
                      children: [
                        Text("Welcome to Mengobrol",style: mTextStyle23(mFontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Share with anyone, anywhere.\nA home for all groups in your life.",style: mTextStyle18(mColor: Colors.grey.shade600),textAlign: TextAlign.center,),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                        backgroundColor: AppColors.primaryColor,
                        textWidget:  Text("Sign in",style: mTextStyle18(mFontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        }),
                    CustomElevatedButton(
                        textWidget:  Text("Create an account",style: mTextStyle18(mFontWeight: FontWeight.bold),),
                        mBorderSide: BorderSide(width: 1,color: Colors.grey.shade300),
                        onPressed: (){ /// here initialising the root of Register repository.
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                        /* Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> RepositoryProvider(
                              create: (context)=>FirebaseRepository(),
                            child: BlocProvider(create:  (context)=>RegisterCubit(
                                firebaseRepository: RepositoryProvider.of<FirebaseRepository>(context)),
                              child: RegisterScreen(),)
                          ),
                          ));*/
                        }
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}