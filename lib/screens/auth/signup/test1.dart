import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef void ChangeStepCallBack(bool nextStep);

class Test1 extends StatelessWidget {
  final ChangeStepCallBack onChangeStep;
  const Test1({super.key, required this.onChangeStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text('Go to page 2'),
        onPressed: () {
          onChangeStep(true);
        },
      ),
    );
  }
}
