import 'package:chat_app/data/model/userModel.dart';
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:chat_app/ui/ChatScreen.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Text("All contact",style: mTextStyle18(mColor: Colors.white),),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
          future: FirebaseRepository.getAllContacts(),
          builder: (_,snapShot){
            if(snapShot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if(snapShot.hasError){
              return Center(child: Text("${snapShot.error.toString()}"));
            } else if(snapShot.hasData){
              return ListView.builder(
                  itemCount: snapShot.data!.docs.length,
                  itemBuilder: (context, index){
                    var currentModel = UserModel.fromDoc(snapShot.data!.docs[index].data());
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Colors.grey.shade700,
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(userId: currentModel.userId,userName: currentModel.userName, userProfilePic: currentModel.profilePic,)));
                            },
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: currentModel.profilePic !=""? NetworkImage("${currentModel.profilePic}") : AssetImage("assets/icon/user.png") ),
                            title: Text("${currentModel.userName}".toUpperCase(),style: mTextStyle18(mFontWeight: FontWeight.w500,mColor: Colors.white),),
                            subtitle: Text("${currentModel.userMobileNumber}",style: mTextStyle16(mColor: Colors.grey.shade200),),
                          )),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}