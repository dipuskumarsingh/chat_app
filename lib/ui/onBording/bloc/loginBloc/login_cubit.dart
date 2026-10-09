import 'package:bloc/bloc.dart';
import 'package:chat_app/data/remote/firebase_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  FirebaseRepository firebaseRepository;
  LoginCubit({required this.firebaseRepository}) : super(LoginInitialState());

  void authenticateUser({required String email,  required String password})async{
    emit(LoginInitialState());
    try{
      await firebaseRepository.loginUser(email: email, password: password);
      emit(LoginSuccessState());
  } catch(e){
      emit(LoginFiledState(errorMsg: e.toString()));
    }
}
}
