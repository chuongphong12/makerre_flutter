import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../configs/color.dart';

typedef ChangeStepCallBack = void Function(bool nextStep);

class SignUpInputInforScreen extends StatelessWidget {
  final ChangeStepCallBack changeStepCallBack;

  const SignUpInputInforScreen({super.key, required this.changeStepCallBack});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              '이름',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            textFieldLayout(context, 'name', '이름 입력', () {}),
            const SizedBox(
              height: 20,
            ),
            Text(
              '생년월일',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            birthdayLayout(context),
            const SizedBox(
              height: 20,
            ),
            Text(
              '이름',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(double.infinity, 52),
                        shadowColor: ColorConfig.grayE0Color,
                        elevation: 3,
                        backgroundColor: ColorConfig.whiteColor,
                        surfaceTintColor: ColorConfig.whiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: Text(
                      '남 ',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.grayBDColor,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(double.infinity, 52),
                        shadowColor: ColorConfig.grayE0Color,
                        elevation: 3,
                        backgroundColor: ColorConfig.whiteColor,
                        surfaceTintColor: ColorConfig.whiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: Text(
                      '여 ',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.grayBDColor,
                          ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '주소',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(flex: 2, child: textFieldLayout(context, 'postcode', '휴대폰 번호 입력', () {})),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size(double.infinity, 52),
                          surfaceTintColor: ColorConfig.whiteColor,
                          foregroundColor: ColorConfig.whiteColor,
                          backgroundColor: ColorConfig.grayBDColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                      child: Text(
                        '인증문자 받기',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: ColorConfig.whiteColor),
                      ),
                      onPressed: () {},
                    ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            textFieldLayout(context, 'address', '주소 입력', () {}),
            const SizedBox(
              height: 12,
            ),
            textFieldLayout(context, 'address_detail', '상세주소 입력', () {}),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(double.infinity, 52),
                        shadowColor: ColorConfig.grayE0Color,
                        elevation: 3,
                        backgroundColor: ColorConfig.whiteColor,
                        surfaceTintColor: ColorConfig.whiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      changeStepCallBack(false);
                    },
                    child: Text(
                      '이전',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.grayBDColor,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(double.infinity, 52),
                        shadowColor: ColorConfig.grayE0Color,
                        elevation: 3,
                        backgroundColor: ColorConfig.whiteColor,
                        surfaceTintColor: ColorConfig.whiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      changeStepCallBack(true);
                    },
                    child: Text(
                      '완료',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: ColorConfig.grayBDColor,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row birthdayLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: textFieldLayout(context, 'year', '0000', () {})),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '년',
            style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(flex: 1, child: textFieldLayout(context, 'month', '00', () {})),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '월',
            style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(flex: 1, child: textFieldLayout(context, 'day', '00', () {})),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '일',
            style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  FormBuilderTextField textFieldLayout(
      BuildContext context, String keyName, String hintName, Function onSubmit) {
    return FormBuilderTextField(
      style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.normal),
      name: keyName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: hintName,
        hintStyle: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: ColorConfig.grayBDColor, fontWeight: FontWeight.normal),
        filled: false,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: ColorConfig.grayBDColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: ColorConfig.grayBDColor, width: 1)),
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.normal, color: ColorConfig.primaryColor),
      ),
      validator: (value) {
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value ?? "")) {
          return "이미 사용 중인 이메일입니다.";
        }
        return null;
      },
      onSubmitted: onSubmit(),
    );
  }
}
