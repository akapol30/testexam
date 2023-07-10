import 'package:example1/piclass.dart';

abstract class PIState {
  PIState();
}

class InititalPIState extends PIState {}

class PiListState extends PIState {
  List<PIItem> pi;
  PiListState(this.pi);
}
