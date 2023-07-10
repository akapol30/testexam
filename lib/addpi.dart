import 'package:example1/bloc/pibloc.dart';
import 'package:example1/bloc/pievent.dart';
import 'package:example1/bloc/pistate.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddPi extends StatefulWidget {
  const AddPi({super.key});

  @override
  State<AddPi> createState() => _AddPiState();
}

class _AddPiState extends State<AddPi> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Data")),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: "Notes"),
            ),
            BlocBuilder<PIBloc, PIState>(builder: (context, state) {
              return ElevatedButton(
                  onPressed: () async {
                    context.read<PIBloc>().add(AddPIEvent(const Uuid().v4(),
                        titleController.text, notesController.text));
                    context.read<PIBloc>().add(FetchPIEvent());
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  },
                  child: const Text("บันทึก"));
            })
          ]),
        )));
  }
}
