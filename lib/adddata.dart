import 'package:example1/bloc/stepbloc.dart';
import 'package:example1/bloc/stepevent.dart';
import 'package:example1/bloc/stepstate.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uuid/uuid.dart';

class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();

  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("กรอกข้อมูล"),
          centerTitle: true,
        ),
        body: BlocListener<StepBloc, STEPState>(
          listener: (context, state) {
            if (state is InititalStepState) {
              print("test............................");
              // do something
            } else {
              // add more condition if there's more states.
            }
          },
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                /*context.read<StepBloc>().add(AddStepEvent(
                    const Uuid().v4(),
                    fullnameController.text,
                    emailController.text,
                    telController.text,
                    addressController.text,
                    postcodeController.text));
                context.read<StepBloc>().add(FetchStepEvent());
                if (!mounted) return;
                Navigator.of(context).pop();*/
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    });
            },
          ),
        ));
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Personal'),
          content: Column(
            children: [
              TextField(
                controller: fullnameController,
                decoration: const InputDecoration(labelText: "ชื่อ-นามสกุล"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "e-mail"),
              ),
              TextField(
                controller: telController,
                decoration: const InputDecoration(labelText: "เบอร์โทร"),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Address ID'),
          content: Column(
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                controller: addressController,
                decoration: const InputDecoration(labelText: "ที่อยู่"),
              ),
              TextField(
                controller: postcodeController,
                decoration: const InputDecoration(labelText: "รหัสไปรษณีย์"),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep == 2,
          title: Text('Complete'),
          content: Column(
            children: [
              Text('ชื่อ-นามสกุล : ${fullnameController.text}'),
              Text('e-mail : ${emailController.text}'),
              Text('เบอร์โทร : ${telController.text}'),
              Text('ที่อยู่ : ${addressController.text}'),
              Text('รหัสไปรษณีย์ : ${postcodeController.text}'),
            ],
          ),
        )
      ];
}
