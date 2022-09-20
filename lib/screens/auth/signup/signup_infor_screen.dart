import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makerre_flutter/screens/auth/signup/test1.dart';
import 'package:makerre_flutter/screens/auth/signup/test2.dart';

class SignUpInforScreen extends StatefulWidget {
  const SignUpInforScreen({super.key});

  @override
  State<SignUpInforScreen> createState() => _SignUpInforScreenState();
}

class _SignUpInforScreenState extends State<SignUpInforScreen> {
  double progressBarValue = 0.5;

  void changeProgessValue(bool nextStep) {
    if (nextStep == true) {
      setState(() {
        progressBarValue += 0.5;
      });
    } else {
      setState(() {
        progressBarValue -= 0.5;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/icons/Logo.svg', width: 110),
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progressBarValue,
          ),
          const SizedBox(height: 24),
          if (progressBarValue == 0.5) ...[
            Test1(
              onChangeStep: (bool nextStep) {
                changeProgessValue(nextStep);
              },
            ),
          ] else ...[
            Test2(
              onChangeStep: (bool nextStep) {
                changeProgessValue(nextStep);
              },
            ),
          ],
        ],
      ),
    );
  }
}
