
import 'package:chat_app/ui/onBording/bloc/loginBloc/login_cubit.dart';
import 'package:chat_app/ui/onBording/bloc/registerBloc/register_bloc.dart';
import 'package:chat_app/ui/onBording/introScreen.dart';
import 'package:chat_app/ui/onBording/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/remote/firebase_repository.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( RepositoryProvider(create: (context)=>FirebaseRepository(),
      child:MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegisterCubit(firebaseRepository: RepositoryProvider.of<FirebaseRepository>(context))),
            BlocProvider(create: (context) => LoginCubit(firebaseRepository: RepositoryProvider.of<FirebaseRepository>(context)),),
          ],
  child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen());
  }
}
