import 'package:example1/piclass.dart';

abstract class STEPState {
  STEPState();
}

class InititalStepState extends STEPState {}

class StepListState extends STEPState {
  List<PIItem> pi;
  StepListState(this.pi);
}
