import 'package:flutter/material.dart';

class StepperViewsApp extends StatefulWidget {
  const StepperViewsApp({super.key});

  @override
  State<StepperViewsApp> createState() => _StepperViewsAppState();
}

class _StepperViewsAppState extends State<StepperViewsApp> {
  int currentstep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sarah Clothes App'),
        backgroundColor: Colors.pink,
      ),
      body: Stepper(
        currentStep: currentstep,
        onStepTapped: (int step) {
          setState(() {
            currentstep = step;
          });
        },
        onStepContinue: () {
          if (currentstep < 2) {
            setState(() {
              currentstep += 1;
            });
          }
        },
        onStepCancel: () {
          if (currentstep > 0) {
            setState(() {
              currentstep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: Text('Step 1'),
            content: Text('Content for Step 1'),
            isActive: currentstep >= 0,
          ),
          Step(
            title: Text('Step 2'),
            content: Text('Content for Step 2'),
            isActive: currentstep >= 1,
          ),
          Step(
            title: Text('Step 3'),
            content: Text('Content for Step 3'),
            isActive: currentstep >= 2,
          ),
        ],
      ),
    );
  }
}
