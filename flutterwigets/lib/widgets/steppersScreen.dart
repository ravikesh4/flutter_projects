import 'package:flutter/material.dart';
import 'package:flutterwigets/widgets/gridViewScreen.dart';

class SteppersScreen extends StatefulWidget {
  @override
  _SteppersScreenState createState() => _SteppersScreenState();
}

class _SteppersScreenState extends State<SteppersScreen> {
  int stepCounter = 0;
  List<Step> steps = [
    Step(
      title: Text('Step One'),
      content: Text('First Step'),
      isActive: true,
    ),
    Step(
      title: Text('Step two'),
      content: Text('Second Step'),
      isActive: true,
    ),
    Step(
      title: Text('Step Three'),
      content: Text('Third Step'),
      isActive: true,
    ),
    Step(
      title: Text('Step Four'),
      content: Text('Go to grid view '),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper App'),
      ),
      body: Container(
        child: Stepper(
            steps: steps,
            currentStep: this.stepCounter,
            type: StepperType.vertical,
            onStepTapped: (step) {
              setState(() {
                stepCounter = step;
              });
            },
            onStepCancel: () {
              setState(() {
                stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
              });
            },
            onStepContinue: () {
              setState(() {
                stepCounter < steps.length - 1
                    ? stepCounter += 1
                    : Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewScreen(),));
              });
            }),
      ),

    );
  }
}
