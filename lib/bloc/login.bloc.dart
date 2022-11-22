import 'package:bloc/bloc.dart';

abstract class AuthEvent {}

//events
class LoginEvent extends AuthEvent {
  final String userName;
  final String password;
  //constructor
  LoginEvent(this.userName, this.password);
}

//states
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final String username;
  //constructor
  AuthLoadedState(this.username,);
}

class AuthErrorState extends AuthState {}

//Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on((AuthEvent event, emit) async {
      if (event is LoginEvent) {
        if (event.userName.isEmpty || event.password.isEmpty) {
          emit(AuthErrorState());
        } else {
          emit(AuthLoadingState());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(AuthLoadedState(event.userName));
          });
        }
      }
    });
  }
}