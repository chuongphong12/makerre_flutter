import 'package:flutter/material.dart';
import 'package:makerre_flutter/configs/color.dart';

typedef void ChangeStepCallBack(bool nextStep);

class VerifyOTPScreen extends StatelessWidget {
  final ChangeStepCallBack nextStep;
  VerifyOTPScreen({super.key, required this.nextStep});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 48,
        ),
        Text(
          '휴대폰 번호',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  hintText: '휴대폰 번호 입력',
                  hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                      color: ColorConfig.grayBDColor,
                      fontWeight: FontWeight.normal),
                  filled: false,
                  border: OutlineInputBorder(
                      gapPadding: 2,
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: ColorConfig.grayBDColor)),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 2,
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: ColorConfig.grayBDColor)),
                ),
              ),
            ),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
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
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: '인증번호 입력',
            hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                color: ColorConfig.grayBDColor, fontWeight: FontWeight.normal),
            filled: false,
            border: OutlineInputBorder(
                gapPadding: 2,
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorConfig.grayBDColor)),
            focusedBorder: OutlineInputBorder(
                gapPadding: 2,
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorConfig.grayBDColor)),
          ),
        ),
      ]),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                nextStep(false);
              },
              child: Text(
                '이전 ',
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                nextStep(true);
              },
              child: Text(
                '다음 ',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: ColorConfig.grayBDColor,
                    ),
              ),
            ),
          )
        ],
      )
    ]);
  }
}
