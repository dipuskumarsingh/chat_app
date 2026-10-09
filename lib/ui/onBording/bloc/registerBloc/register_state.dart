
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}
final class RegisterLoadingState extends RegisterState{}
final class RegisterSuccessState extends RegisterState{}
final class RegisterFailedState extends RegisterState{
  String errorMsg;
  RegisterFailedState({required this.errorMsg});
}
