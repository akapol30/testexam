import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example1/bloc/pievent.dart';
import 'package:example1/bloc/pistate.dart';
import 'package:example1/piclass.dart';
import 'package:example1/piprovider.dart';

class PIBloc extends Bloc<PIEvent, PIState> {
  final PIProvider _piProvider = PIProvider.instace;
  PIBloc() : super(InititalPIState()) {
    List<PIItem> pi = [];
    on<AddPIEvent>(
      (event, emit) async {
        //  await _piProvider.insertPI(PIItem(
        //       id: event.id, title: event.title, notes: event.notes, done: false));
      },
    );

    on<DeletePIEvent>(
      (event, emit) async {
        await _piProvider.deletePI(event.item);
      },
    );

    on<FetchPIEvent>(
      (event, emit) async {
        pi = await _piProvider.fetchPI();
        emit(PiListState(pi));
      },
    );
  }
}
