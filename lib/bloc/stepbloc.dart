import 'package:example1/bloc/stepevent.dart';
import 'package:example1/bloc/stepstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example1/piclass.dart';
import 'package:example1/piprovider.dart';

class StepBloc extends Bloc<StepEvent, STEPState> {
  final PIProvider _piProvider = PIProvider.instace;
  StepBloc() : super(InititalStepState()) {
    List<PIItem> pi = [];
    on<AddStepEvent>(
      (event, emit) async {
        await _piProvider.insertPI(PIItem(
            id: event.id,
            fullname: event.fullname,
            email: event.email,
            tel: event.tel,
            address: event.address,
            postcode: event.postcode,
            done: false));
      },
    );

    on<DeleteStepEvent>(
      (event, emit) async {
        await _piProvider.deletePI(event.item);
      },
    );

    on<FetchStepEvent>(
      (event, emit) async {
        pi = await _piProvider.fetchPI();
        emit(StepListState(pi));
      },
    );
  }
}
