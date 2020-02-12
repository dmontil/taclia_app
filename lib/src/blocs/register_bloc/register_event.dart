import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}
//functions
class doRegisterEvent extends RegisterEvent{
  final String email;
  final String password;

  doRegisterEvent(this.email, this.password);

  @override
  List<Object> get props => [email,password];

}
