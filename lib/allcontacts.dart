import 'package:example1/bloc/pibloc.dart';
import 'package:example1/bloc/pievent.dart';

import 'package:example1/bloc/stepbloc.dart';
import 'package:example1/bloc/stepevent.dart';
import 'package:example1/bloc/stepstate.dart';

import 'package:example1/piprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllContacts extends StatefulWidget {
  const AllContacts({super.key});

  @override
  State<AllContacts> createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {
  final PIProvider _piProvider = PIProvider.instace;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepBloc, STEPState>(builder: (context, state) {
      if (state is InititalStepState) {
        context.read<StepBloc>().add(FetchStepEvent());
      }
      if (state is StepListState) {
        var items = state.pi;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var piItem = items[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(),
              secondaryBackground: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                setState(() {
                  _piProvider.deletePI(piItem);
                });
              },
              child: ListTile(
                  leading: Checkbox(
                    value: piItem.done,
                    onChanged: (value) {},
                  ),
                  title: Text(piItem.fullname),
                  subtitle: Text(piItem.tel)),
            );
          },
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  // Future<List<PIItem>> _fetchPI() async {
  //   return await _piProvider.fetchPI();
  // }
}
