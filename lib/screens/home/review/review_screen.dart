import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset('assets/images/icons/Logo.svg'),
      ),
    );
  }
}
