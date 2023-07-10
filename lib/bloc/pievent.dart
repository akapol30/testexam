import 'package:example1/piclass.dart';

abstract class PIEvent {
  PIEvent();
}

class AddPIEvent extends PIEvent {
  String id;
  String title;
  String notes;

  AddPIEvent(this.id, this.title, this.notes);
}

class DeletePIEvent extends PIEvent {
  PIItem item;
  DeletePIEvent(this.item);
}

class FetchPIEvent extends PIEvent {
  FetchPIEvent();
}
