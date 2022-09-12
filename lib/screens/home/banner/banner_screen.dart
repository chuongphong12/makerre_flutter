import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            'assets/images/icons/Logo.svg',
            width: 120,
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color(0xFFE0E0E0),
                ),
                SizedBox(
                  height: 40,
                  child: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color(0xFFE0E0E0),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(child: Image.asset('assets/images/bg.jpeg')),
    );
  }
}
