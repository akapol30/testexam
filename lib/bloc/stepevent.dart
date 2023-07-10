import 'package:example1/piclass.dart';

abstract class StepEvent {
  StepEvent();
}

class AddStepEvent extends StepEvent {
  String id;
  String fullname;
  String email;
  String tel;
  String address;
  String postcode;

  AddStepEvent(this.id, this.fullname, this.email, this.tel, this.address,
      this.postcode);
}

class DeleteStepEvent extends StepEvent {
  PIItem item;
  DeleteStepEvent(this.item);
}

class FetchStepEvent extends StepEvent {
  FetchStepEvent();
}
