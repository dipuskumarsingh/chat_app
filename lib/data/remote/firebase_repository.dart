

import 'package:chat_app/data/model/massageModel.dart';
import 'package:chat_app/data/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseRepository {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static const COLLECTION_USER = "Users";
  static const COLLECTION_CHATROOM = "chatroom";
  static const COLLECTION_MASSAGE = "massages";
  static const PREPS_USER_ID_KEY = "user";

 Future<dynamic> createUser({required UserModel user, required String pass})async{
    try{
      var userCred = await firebaseAuth.createUserWithEmailAndPassword(email: user.userEmail!, password: pass);
      if(userCred.user != null){
        user.userId = userCred.user!.uid; /// this is used for store user id in to data base firestore
        firebaseFirestore.collection(COLLECTION_USER)
            .doc(userCred.user!.uid)
            .set(user.toDoc())
            .catchError((error){
          throw(Exception("Error: $error"));
        });
      }
    }on FirebaseAuthException catch(e){
      throw(Exception("Error: $e"));
    }catch(e){
      throw(Exception("Error: $e"));
    }
  }

 Future<void> loginUser({required String email, required String password})async{
   try{
     var userCred = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     if(userCred.user!=null){
       /// storing userId in to sharedPreferences
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString(PREPS_USER_ID_KEY, userCred.user!.uid);
     }
   }on FirebaseAuthException catch(e){
     throw(Exception("Error: Invalid Email and Password"));
   } catch(e){
     throw(Exception("Error: $e"));
   }
  }
 static Future<QuerySnapshot<Map<String,dynamic>>> getAllContacts(){
   return firebaseFirestore.collection(COLLECTION_USER).get();
  }

  /// get fromId by using SharedPreferences
  static Future<String> getFromId() async {
      var prefs = await SharedPreferences.getInstance();
      return prefs.getString(PREPS_USER_ID_KEY)!;
  }

  /// geting chat id
  static String getChatId({required String fromId, required String toId}){
   if(fromId.hashCode<=toId.hashCode){
     return "${fromId}_$toId}";
   }else{
     return "${toId}_$fromId)";
   }
  }
  static sendTextMassage({required String toId, required String msg})async{
   String fromId = await getFromId();
   var chatId = await getChatId(fromId: fromId, toId: toId);
   var currentTime = DateTime.now().millisecondsSinceEpoch.toString();
   var massageModel = MassageModel(
       massageId: currentTime,
       massage: msg,
       sentAt: currentTime,
       fromId: fromId,
       toId: toId,
   );
   firebaseFirestore
       .collection(COLLECTION_CHATROOM)
       .doc(chatId)
       .collection(COLLECTION_MASSAGE)
       .doc(currentTime)
       .set(massageModel.toDoc());

  }

  static sendImageMassage({required String toId, required String imageUrl, String msg = ""})async{
   String fromId = await getFromId();
   var chatId = await getChatId(fromId: fromId, toId: toId);
   var currentTime = DateTime.now().millisecondsSinceEpoch.toString();
   var massageModel = MassageModel(
       massageId: currentTime,
       massage: msg,
       sentAt: currentTime,
       fromId: fromId,
       imageUrl: imageUrl,
       massageType: 1,
       toId: toId,
   );
   firebaseFirestore
       .collection(COLLECTION_CHATROOM)
       .doc(chatId)
       .collection(COLLECTION_MASSAGE)
       .doc(currentTime)
       .set(massageModel.toDoc());

  }
}