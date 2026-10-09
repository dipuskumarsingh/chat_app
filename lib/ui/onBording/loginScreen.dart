

import 'package:chat_app/coustom/coustomTextfiled.dart';
import 'package:chat_app/coustom/customButoon.dart';
import 'package:chat_app/ui/onBording/bloc/loginBloc/login_cubit.dart';
import 'package:chat_app/ui/onBording/introScreen.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottomNavigation.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  GlobalKey<FormState> mKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 30,left: 15, right: 15,),
          child: ListView(
            children: [
              Text("Let's join with us",style: mTextStyle23(mFontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text("Enter your Email Address and\n password to get Login.",style: mTextStyle18(mFontWeight: FontWeight.normal,mColor: Colors.grey.shade600),textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text("Login Your Self",style: mTextStyle23(mFontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              CustomTextField(
                  hintText: "yourmail@xyz.com",
                controller: emailController,
                prefixIcon: Icons.email_outlined,
                validate: (value){
                  if(value!.isEmpty){
                      return "Email cannot be empty.";
                    }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              CustomTextField(
                  hintText: "*********",
                controller: passwordController,
                prefixIcon: Icons.lock_outline,
                suffixIcon: isPasswordVisible ?  Icons.remove_red_eye_rounded : Icons.visibility_off,
                obscureText: !isPasswordVisible,
                onSuffixTap: (){
                    isPasswordVisible = !isPasswordVisible;
                    setState(() {

                    });
                },
                validate: (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty.";
                    }else{
                      return null;
                    }
                } ,
              ),
              SizedBox(height: 15,),
              BlocConsumer<LoginCubit, LoginState>(
                  builder: (_,state){
                    if(state is LoginLoadingState){
                      return  CustomElevatedButton(
                          textWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircularProgressIndicator(backgroundColor: Colors.black,),
                              ),
                              SizedBox(width: 10,),
                              Text("Authenticating...",style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: Colors.grey.shade600),),
                            ],
                          ),
                          backgroundColor: AppColors.buttonColor,
                          onPressed: (){});
                    }
                    return CustomElevatedButton(
                        textWidget: Text("Continue",style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: Colors.grey.shade600),),
                        backgroundColor: AppColors.buttonColor,
                        onPressed: (){
                          if(mKey.currentState!.validate()){
                            String mEmail = emailController.text;
                            String mPassword = passwordController.text;

                            BlocProvider.of<LoginCubit>(context).authenticateUser(email: mEmail, password: mPassword);
                          }
                        });
                  },
                  listener: (_,state){
                    if(state is LoginFiledState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg,style: mTextStyle16(mColor: Colors.white),)));
                    } else if(state is LoginSuccessState){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomNavigation()));
                    }
                  }),

            ],
          ),
        ),
      ),
    );
  }
}