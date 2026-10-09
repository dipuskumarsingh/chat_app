

import 'package:chat_app/coustom/coustomTextfiled.dart';
import 'package:chat_app/coustom/customButoon.dart';
import 'package:chat_app/data/model/userModel.dart';
import 'package:chat_app/ui/onBording/bloc/registerBloc/register_bloc.dart';
import 'package:chat_app/ui/onBording/bloc/registerBloc/register_state.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

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
              Text("Enter your Email Address\n to get started.",style: mTextStyle18(mFontWeight: FontWeight.normal,mColor: Colors.grey.shade600),textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text("Register Your Self",style: mTextStyle23(mFontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              CustomTextField(
                hintText: "Name",
                controller: nameController,
                prefixIcon: Icons.account_circle_outlined,
                validate: (value){
                  if(value!.isEmpty){
                    return "Name cannot be empty.";
                  } else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              CustomTextField(
                hintText: "yourmail@xyz.com",
                controller: emailController,
                prefixIcon: Icons.email_outlined,
                validate: (value){
                  var emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if(value!.isEmpty){
                    return "Email cannot be empty";
                  } else if(!emailRegExp.hasMatch(value)){
                    return "Invalid email address";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 15,),
              CustomTextField(
                hintText: "+91 1234567890",
                controller: phoneNumberController,
                prefixIcon: Icons.phone_outlined,
                validate: (value){
                  if(value!.isEmpty){
                    return "Mobile number cannot be empty.";
                  }else if(value.length!=10){
                    return "Mobile number is Invalid.";
                  } else{
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
                  } else if(value.length < 6){
                    return "Password should be at-least 6 characters long.";
                  }else{
                    return null;
                  }
                } ,
              ),
              SizedBox(height: 15,),
                 /*CustomElevatedButton(
                     textWidget: Text("Continue",style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: Colors.grey.shade600),),
                     backgroundColor: AppColors.buttonColor,
                     onPressed: ()async{
                       if(mKey.currentState!.validate()){
                         String name = nameController.text;
                         String email = emailController.text;
                         String mobileNumber = phoneNumberController.text;
                         String password = passwordController.text;

                         if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && phoneNumberController.text.isNotEmpty && passwordController.text.isNotEmpty){
                           var newUser = UserModel(
                             userName: name,
                             userMobileNumber: mobileNumber,
                             userCreatedAt: DateTime.now().millisecondsSinceEpoch,
                             userEmail: email,
                             isOnline: false,
                             status: 1,
                             profilePic: "",
                             profileStatus: 1,
                           );
                           BlocProvider.of<RegisterCubit>(context).registerUser(newUser, password);
                         }

                         Navigator.pop(context);

                       }
                     }),*/
             BlocConsumer<RegisterCubit,RegisterState>(
               builder:(_,state){
                 if(state is RegisterLoadingState){
                   return  CustomElevatedButton(
                       textWidget: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: CircularProgressIndicator(),
                           ),
                           SizedBox(width: 10,),
                           Text("Creating user...",style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: Colors.grey.shade600),),
                         ],
                       ),
                       backgroundColor: AppColors.buttonColor,
                       onPressed: (){});
                 }

                 return  CustomElevatedButton(
                     textWidget: Text("Continue",style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: Colors.grey.shade600),),
                     backgroundColor: AppColors.buttonColor,
                     onPressed: ()async{
                       if(mKey.currentState!.validate()){
                         String name = nameController.text;
                         String email = emailController.text;
                         String mobileNumber = phoneNumberController.text;
                         String password = passwordController.text;

                         if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && phoneNumberController.text.isNotEmpty && passwordController.text.isNotEmpty){
                           var newUser = UserModel(
                             userName: name,
                             userMobileNumber: mobileNumber,
                             userCreatedAt: DateTime.now().millisecondsSinceEpoch,
                             userEmail: email,
                             isOnline: false,
                             status: 1,
                             profilePic: "",
                             profileStatus: 1,
                           );
                           BlocProvider.of<RegisterCubit>(context).registerUser(newUser, password);
                         }

                       }
                     });
               } ,
             listener:(_,state){
                 if(state is RegisterFailedState){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg,style: mTextStyle16(mColor: Colors.white),)));
                 } else if(state is RegisterSuccessState){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                   Navigator.pop(context);
                 }
             } ,)
            ],
          ),
        ),
      ),
    );
  }
}