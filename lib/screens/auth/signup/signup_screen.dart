import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:makerre_flutter/configs/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool isSelectCustomer = true;

class _SignUpScreenState extends State<SignUpScreen> {
  bool isTermPolicy = false;
  bool isMarketing = false;
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
              color: isSelectCustomer
                  ? ColorConfig.blackColor
                  : ColorConfig.whiteColor,
              surfaceTintColor: ColorConfig.whiteColor,
              elevation: 5,
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
          FormBuilder(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16),
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
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    hintText: '이메일 입력',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: ColorConfig.grayBDColor),
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
                    // if (value.isEmpty!) {
                    //   return "sdf";
                    // }
                    return null;
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
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    hintText: '비밀번호 입력',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: ColorConfig.grayBDColor),
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
                    // if (value.isEmpty!) {
                    //   return "sdf";
                    // }
                    return null;
                  },
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
                  name: 'password',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    hintText: '비밀번호 재입력',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: ColorConfig.grayBDColor),
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
                    // if (value.isEmpty!) {
                    //   return "sdf";
                    // }
                    return null;
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
              child: Card(
                elevation: 3,
                color: ColorConfig.whiteColor,
                surfaceTintColor: ColorConfig.whiteColor,
                shadowColor: ColorConfig.grayE0Color,
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  child: Text(
                    '회원가입',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: ColorConfig.grayBDColor),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
