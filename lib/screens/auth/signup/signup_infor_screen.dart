import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/configs/color.dart';
import 'package:makerre_flutter/screens/auth/signup/signup_input_infor_screen.dart';
import 'package:makerre_flutter/screens/auth/signup/verifyOTP_screen.dart';

class SignUpInforScreen extends StatefulWidget {
  const SignUpInforScreen({super.key});

  @override
  State<SignUpInforScreen> createState() => _SignUpInforScreenState();
}

class _SignUpInforScreenState extends State<SignUpInforScreen> {
  double progressBarValue = 0.5;
  String titleProgress = '휴대폰 인증을 해주세요';

  void changeProgessValue(bool nextStep) {
    if (nextStep == true) {
      setState(() {
        if (progressBarValue == 0.5) {
          progressBarValue += 0.5;
          titleProgress = '개인정보를 입력해주세요';
        } else {
          GoRouter.of(context).goNamed('home');
        }
      });
    } else {
      setState(() {
        if (progressBarValue == 1) {
          titleProgress = '휴대폰 인증을 해주세요';
          progressBarValue -= 0.5;
        } else {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/icons/Logo.svg', width: 110),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: ColorConfig.grayE0Color,
            width: double.infinity,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progressBarValue,
                backgroundColor: ColorConfig.grayE0Color,
              ),
              const SizedBox(
                height: 52,
              ),
              Text(
                titleProgress,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 24),
              if (progressBarValue == 0.5) ...[
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: VerifyOTPScreen(
                    nextStep: (bool nextStep) {
                      changeProgessValue(nextStep);
                    },
                  ),
                ),
              ] else ...[
                SignUpInputInforScreen(
                  changeStepCallBack: (bool nextStep) {
                    changeProgessValue(nextStep);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
