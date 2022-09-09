import 'package:flutter/material.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Image.network(
            'https://64.media.tumblr.com/0311338c2f1aa84f4b2511fc8c419048/ebcedf09e8064638-aa/s1280x1920/a27f6bdecdeef0c832717560e86d0e6f808594b2.jpg'),
      ),
    );
  }
}
