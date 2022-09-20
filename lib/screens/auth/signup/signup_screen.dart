import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/configs/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isTermPolicy = false;
  bool isMarketing = false;

  bool isSelectCustomer = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValidate = false;

  @override
  void initState() {
    super.initState();
  }

  void _validateForm() {
    _formKey.currentState!.validate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectCustomer = true;
              });
            },
            child: Card(
              margin: EdgeInsets.zero,
              color: isSelectCustomer
                  ? ColorConfig.blackColor
                  : ColorConfig.whiteColor,
              surfaceTintColor: ColorConfig.whiteColor,
              elevation: 3,
              shadowColor: ColorConfig.grayBDColor,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Icon(
                    Icons.check_circle,
                    color: isSelectCustomer
                        ? ColorConfig.whiteColor
                        : ColorConfig.blackColor,
                  ),
                ),
                Expanded(
                  child: ListTile(
                      title: Text(
                        "고객으로 가입",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: isSelectCustomer
                                ? ColorConfig.whiteColor
                                : ColorConfig.blackColor),
                      ),
                      subtitle: Text(
                        "장인의 도움을 받고 싶어요.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: isSelectCustomer
                                  ? ColorConfig.grayBDColor
                                  : ColorConfig.dark75Color,
                            ),
                      )),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectCustomer = false;
              });
            },
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 3,
              surfaceTintColor: ColorConfig.whiteColor,
              color: isSelectCustomer
                  ? ColorConfig.whiteColor
                  : ColorConfig.blackColor,
              shadowColor: ColorConfig.grayBDColor,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8),
                  child: Icon(
                    Icons.check_circle,
                    color: isSelectCustomer
                        ? ColorConfig.blackColor
                        : ColorConfig.whiteColor,
                  ),
                ),
                Expanded(
                  child: ListTile(
                      title: Text(
                        "고객으로 가입",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: isSelectCustomer
                                ? ColorConfig.blackColor
                                : ColorConfig.whiteColor),
                      ),
                      subtitle: Text(
                        "장인의 도움을 받고 싶어요.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: ColorConfig.grayBDColor,
                            ),
                      )),
                ),
              ]),
            ),
          ),
          if (!isSelectCustomer) ...[
            Container(
              padding: const EdgeInsets.only(top: 28, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '약관 동의',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 32),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: '보증에 의한 약관 동의 ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: ColorConfig.primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: '(5배 자부담)',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontWeight: FontWeight.normal))
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '전체 약관에 동의합니다.',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTermPolicy = !isTermPolicy;
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: isTermPolicy
                              ? ColorConfig.primaryColor
                              : ColorConfig.grayBDColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이용약관 (필수)',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.dark75Color,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTermPolicy = !isTermPolicy;
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: isTermPolicy
                              ? ColorConfig.primaryColor
                              : ColorConfig.grayBDColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이용약관 (필수)',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.dark75Color,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTermPolicy = !isTermPolicy;
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: isTermPolicy
                              ? ColorConfig.primaryColor
                              : ColorConfig.grayBDColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이용약관 (필수)',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.dark75Color,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTermPolicy = !isTermPolicy;
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: isTermPolicy
                              ? ColorConfig.primaryColor
                              : ColorConfig.grayBDColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 16),
                  child: Text(
                    '이메일',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                FormBuilderTextField(
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.normal),
                  name: 'email',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    hintText: '이메일 입력',
                    hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                        color: ColorConfig.grayBDColor,
                        fontWeight: FontWeight.normal),
                    filled: false,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorConfig.grayBDColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: ColorConfig.grayBDColor, width: 1)),
                    errorStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: ColorConfig.primaryColor),
                  ),
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? "")) {
                      return "이미 사용 중인 이메일입니다.";
                    }
                    return null;
                  },
                  onSubmitted: (_) {
                    _validateForm();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 16),
                  child: Text(
                    '비밀번호',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                FormBuilderTextField(
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.normal),
                  name: 'password',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    hintText: '비밀번호 입력',
                    hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                        color: ColorConfig.grayBDColor,
                        fontWeight: FontWeight.normal),
                    filled: false,
                    border: OutlineInputBorder(
                        gapPadding: 2,
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorConfig.grayBDColor)),
                    focusedBorder: OutlineInputBorder(
                        gapPadding: 2,
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorConfig.grayBDColor)),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.match(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        errorText: '영문 대소문자+숫자+특수기호 조합 8자리 이상'),
                  ]),
                  onSubmitted: (_) {
                    _validateForm();
                  },
                  // (value) {
                  //   if (!RegExp(
                  //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  //       .hasMatch(value ?? "")) {
                  //     return "영문 대소문자+숫자+특수기호 조합 8자리 이상 ";
                  //   }
                  //   return null;
                  // },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 16),
                  child: Text(
                    '비밀번호 확인',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                FormBuilderTextField(
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.normal),
                  name: 'password_confirm',
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    hintText: '비밀번호 재입력',
                    hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                        color: ColorConfig.grayBDColor,
                        fontWeight: FontWeight.normal),
                    filled: false,
                    border: OutlineInputBorder(
                        gapPadding: 2,
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorConfig.grayBDColor)),
                    focusedBorder: OutlineInputBorder(
                        gapPadding: 2,
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorConfig.grayBDColor)),
                  ),
                  validator: (value) {
                    if (_formKey.currentState?.fields['password']?.value !=
                        value) {
                      return "비밀번호가 일치하지 않습니다.";
                    }
                    return null;
                  },
                  onSubmitted: (_) {
                    _validateForm();
                  },
                ),
                const SizedBox(
                  height: 43,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTermPolicy = !isTermPolicy;
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: isTermPolicy
                              ? ColorConfig.primaryColor
                              : ColorConfig.grayBDColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: "이용약관 ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: ColorConfig.primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("tap here");
                                },
                              children: <TextSpan>[
                                TextSpan(
                                    text: "및 ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: ColorConfig.dark75Color)),
                                TextSpan(
                                  text: "개인정보처리방침에 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: ColorConfig.primaryColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("tap here 1");
                                    },
                                ),
                                TextSpan(
                                    text: "동의합니다.(필수)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: ColorConfig.dark75Color)),
                              ])),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMarketing = !isMarketing;
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: isMarketing
                              ? ColorConfig.primaryColor
                              : ColorConfig.grayBDColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: "마케팅 수신 및 활용 약관",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: ColorConfig.primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("tap here");
                                },
                              children: <TextSpan>[
                                TextSpan(
                                    text: "에 동의합니다.(선택) ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: ColorConfig.dark75Color)),
                              ])),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: ColorConfig.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 5,
                  backgroundColor: isTermPolicy && (_formKey.currentState?.isValid ?? false)
                      ? ColorConfig.blackColor
                      : ColorConfig.whiteColor,
                  shadowColor: ColorConfig.grayE0Color,
                ),
                child: Text(
                  '회원가입',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: ColorConfig.grayBDColor),
                ),
                onPressed: () {
                  GoRouter.of(context).goNamed('signup_infor');
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
