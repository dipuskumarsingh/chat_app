
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:chat_app/utilles/utillsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  String? userId;
  String? userName;
  String? userProfilePic;
  ChatScreen({required this.userId,required this.userName, required this.userProfilePic});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey.shade300,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: widget.userProfilePic != "" ? NetworkImage("${widget.userProfilePic}"): AssetImage("assets/icon/user.png"),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userName!,style: mTextStyle18(mFontWeight: FontWeight.w500),),
            Text("online",style: mTextStyle16(mColor: Colors.green),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset("assets/icon/cam-recorder.png",width: 30,)),
          IconButton(onPressed: (){}, icon: Image.asset("assets/icon/phone-call.png",width: 22,)),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
        leadingWidth: 70,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5,color: Colors.grey.shade300),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 5,
                child:ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 20,right: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("good morning sir",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80,top: 20,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("good morning sir",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("app log kaise ho achho ki nahi or sab badiya hai n",style: mTextStyle18(),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ) ),
           Expanded(
             flex: 1,
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   IconButton(
                     onPressed: () {},

                     padding: EdgeInsets.zero,

                     constraints:
                     const BoxConstraints(
                       minWidth: 28,
                       minHeight: 35,
                     ),

                     icon: const Icon(
                       Icons.add,
                       size: 25,
                       color: Colors.black87,
                     ),
                   ),

                   const SizedBox(width: 4),
                   Expanded(
                     child: Container(
                       height: 50,

                       decoration: BoxDecoration(
                         color: Color(0xffF7F7F7),

                         borderRadius:
                         BorderRadius.circular(25),
                       ),

                       child:  TextField(
                         style: mTextStyle16(),
                         controller: chatController,
                         decoration: InputDecoration(
                           hintText: "New Chat",

                           hintStyle: mTextStyle16(mColor: Colors.grey.shade500),

                           border: InputBorder.none,
                           suffixIcon: IconButton(onPressed: (){
                             FirebaseRepository.sendTextMassage(toId: widget.userId!, msg: chatController.text); chatController.clear();
                           }, icon: Icon(Icons.send_rounded,size: 22,color: Colors.grey.shade500,)),
                           contentPadding:
                           EdgeInsets.symmetric(
                             horizontal: 12,
                             vertical: 13,
                           ),
                         ),
                       ),
                     ),
                   ),

                   const SizedBox(width: 5),
                   IconButton(
                     onPressed: () {},

                     padding: EdgeInsets.zero,

                     constraints:
                     const BoxConstraints(
                       minWidth: 28,
                       minHeight: 35,
                     ),

                     icon: const Icon(
                       Icons.mic_none,
                       size: 25,
                       color: Colors.black87,
                     ),
                   ),
                 ],
               ), ),

          ],
        ),
      ),
    );
  }
}