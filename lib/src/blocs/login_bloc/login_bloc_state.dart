import 'package:equatable/equatable.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
}

class InitialLoginBlocState extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LogginInBlocState extends LoginBlocState{
  @override
  List<Object> get props => [];
}
class LoggedInBlocState extends LoginBlocState{
  final bool isLog;
  LoggedInBlocState(this.isLog);
  @override
  List<Object> get props => [isLog];

}

class ErrorBlocState extends LoginBlocState{
  final String message;

  ErrorBlocState(this.message);

  @override
  List<Object> get props => [message];

}
