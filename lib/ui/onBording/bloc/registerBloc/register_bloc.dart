
import 'package:chat_app/data/model/userModel.dart';
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:chat_app/ui/onBording/bloc/registerBloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// this is done by Cubit state
class RegisterCubit extends Cubit<RegisterState>{
  FirebaseRepository firebaseRepository;
  RegisterCubit({required this.firebaseRepository})   :   super(RegisterInitialState());

  void registerUser(UserModel user, String pass)async{
    emit(RegisterLoadingState());
    try{
      await firebaseRepository.createUser(user: user, pass: pass);
      emit(RegisterSuccessState());
    } catch(e){
      emit(RegisterFailedState(errorMsg: e.toString()));
    }

  }
}


/// i try to this part by bloc but we get error

/*
import 'package:bloc/bloc.dart';
import 'package:chat_app/data/model/userModel.dart';
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  FirebaseRepository firebaseRepository;
  RegisterBloc({required this.firebaseRepository}) : super(RegisterInitialState()) {
    on<RegisterUserEvent>((event, emit)async{
      emit(RegisterLoadingState());
      try{
        await firebaseRepository.createUser(user: event.userM, pass: event.passwordE!);
        emit(RegisterSuccessState());
      }catch(e){
        emit(RegisterFailedState(errorMsg: e.toString()));
      }
    });
  }
}
*/
