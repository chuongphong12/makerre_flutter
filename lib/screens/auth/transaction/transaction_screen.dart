import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makerre_flutter/configs/color.dart';

import '../../../widgets/app_drawer.dart';
import 'history_transaction_screen.dart';
import 'order_transaction_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/icons/Logo.svg', width: 110),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(84),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(height: 40),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      '나의 거래',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    centerTitle: true,
                    shape: const Border.symmetric(
                      horizontal: BorderSide(
                        color: Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorConfig.grayE0Color, width: 2))),
                    ),
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Text(
                          '요청·제안',
                        ),
                        Text(
                          '거래 내역',
                        ),
                      ],
                      labelStyle: Theme.of(context).textTheme.headline4,
                      indicatorColor: ColorConfig.primaryColor,
                      labelColor: ColorConfig.primaryColor,
                      unselectedLabelColor: ColorConfig.dark11Color,
                      labelPadding: const EdgeInsets.only(bottom: 10, top: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: tabController,
        children: [
          OrderTransactionScreen(),
          HistoryTransactionScreen(),
        ],
      ),
    );
  }
}
