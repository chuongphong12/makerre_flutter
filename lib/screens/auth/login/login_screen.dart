import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final String email = 'customer2618@remaker.kr';
  final String password = 'Admin@123123';

  void _onLoginButtonPress() async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final data = _formKey.currentState!.value;
      try {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            email: data['email'],
            password: data['password'],
          ),
        );
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // The loading indicator
                  const CircularProgressIndicator.adaptive(),
                  const SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text(
                    'Loading...',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ),
        );
        await Future.delayed(
            const Duration(seconds: 2), () => GoRouter.of(context).go('/'));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/BG.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(100, 0, 0, 0),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 108),
                    SvgPicture.asset(
                      'assets/images/icons/Logo.svg',
                      width: 166,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 104),
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이메일',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          const SizedBox(height: 8),
                          FormBuilderTextField(
                            name: 'email',
                            initialValue: email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              fillColor: Colors.black54,
                              hintText: '이메일을 입력해주세요.',
                              hintStyle: const TextStyle(
                                color: Color(0xFF757575),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFBDBDBD)),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 16,
                                    ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            '이메일',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          const SizedBox(height: 8),
                          FormBuilderTextField(
                            name: 'password',
                            initialValue: password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              fillColor: Colors.black54,
                              hintText: '비밀번호를 입력해주세요.',
                              hintStyle: const TextStyle(
                                color: Color(0xFF757575),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFBDBDBD)),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            obscureText: true,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _onLoginButtonPress,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        textStyle: Theme.of(context).textTheme.headline4,
                      ),
                      child: const Text('로그인'),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(height: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.goNamed('signup');
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                            ),
                            child: Text(
                              '이메일로 가입',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: const Color(0xFFE0E0E0),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Color(0xFFE0E0E0),
                            thickness: 1,
                            indent: 3,
                            endIndent: 3,
                            width: 20,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                            ),
                            onPressed: () {},
                            child: Text(
                              '비밀번호 찾기',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: const Color(0xFFE0E0E0),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFFFFE812),
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.train,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF000000),
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.train,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF2BDB71),
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.train,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFFFFFFFF),
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.train,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'SNS 간편로그인',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
