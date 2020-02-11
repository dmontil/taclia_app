import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taclia_app/src/blocs/bloc.dart';
import 'package:taclia_app/src/provider/register_logic.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterLogic logic;
 RegisterBloc ({@required this.logic});
  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is doRegisterEvent){
      yield RegisterinInBlocState();
      try{
        var doneRegister =  await logic.register(event.email, event.password);
        yield RegisteredInBlocState(doneRegister);
      }on RegisterException{
        yield ErrorRegisterBlocState("Fallo en el registro");


      }
    }
  }
}
