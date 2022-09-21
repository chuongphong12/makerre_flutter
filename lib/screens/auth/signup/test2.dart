import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef void ChangeStepCallBack(bool nextStep);

class Test2 extends StatelessWidget {
  final ChangeStepCallBack onChangeStep;
  const Test2({super.key, required this.onChangeStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: const Text('Back to page 1'),
        onPressed: () {
          onChangeStep(false);
        },
      ),
    );
  }
}
