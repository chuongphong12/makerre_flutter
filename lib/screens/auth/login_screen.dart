import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              SvgPicture.asset(
                'assets/images/icons/Logo.svg',
                width: 166,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 150),
              FormBuilder(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이메일',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(name: 'email'),
                    const SizedBox(height: 28),
                    Text(
                      '이메일',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(name: 'email'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Text('로그인'),
              ),
              const SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '이메일로 가입',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: const Color(0xFFE0E0E0),
                          ),
                    ),
                    const VerticalDivider(
                      color: Color(0xFFE0E0E0),
                      thickness: 3,
                      indent: 20,
                      endIndent: 0,
                      width: 20,
                    ),
                    Text(
                      '비밀번호 찾기',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: const Color(0xFFE0E0E0),
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
