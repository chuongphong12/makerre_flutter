import 'package:flutter/material.dart';

import '../../../configs/color.dart';

class OrderTransactionScreen extends StatelessWidget {
  const OrderTransactionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorConfig.gray98Color,
        child: ListView.separated(
            itemCount: 10,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return Card(
                // margin: ,
                surfaceTintColor: ColorConfig.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5),
                                    color: ColorConfig.grayBDColor,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 4),
                                  child: Text('요청중',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: ColorConfig.whiteColor,
                                          )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12),
                                  child: Text('리폼 / 가방',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color:
                                                ColorConfig.dark75Color,
                                          )),
                                ),
                              ],
                            ),
                            Text('2021.08.28',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: ColorConfig.grayBDColor,
                                    )),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '픽스 마스터',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '요즘 스타일로 제작하고 싶어요.',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '택배',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: ColorConfig.grayBDColor),
                        ),
                      ]),
                ),
              );
            }));
  }
}
