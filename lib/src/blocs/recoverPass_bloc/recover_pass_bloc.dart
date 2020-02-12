import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taclia_app/src/blocs/bloc.dart';
import 'package:taclia_app/src/provider/recoverPass_logic.dart';

class RecoverPassBloc extends Bloc<RecoverPassEvent, RecoverPassState> {
  final RecoverPassLogic logic;

  RecoverPassBloc({@required this.logic});
  @override
  RecoverPassState get initialState => InitialRecoverPassState();

  @override
  Stream<RecoverPassState> mapEventToState(
    RecoverPassEvent event,
  ) async* {
      if( event is doRecoverPassEvent){
        try{
          var responseData = await logic.recoverPass(event.email);
          yield RecoveredPassInBlocState(responseData);
        }catch(e){
          print(e);
        }
      }
  }
}
