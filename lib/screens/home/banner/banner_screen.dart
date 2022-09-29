import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makerre_flutter/configs/color.dart';
import 'package:makerre_flutter/models/banner_model.dart';
import 'package:makerre_flutter/repositories/banner_repository.dart';

class BannerScreen extends StatelessWidget {
  final String id;
  const BannerScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final BannerRepository bannerRepository = BannerRepository();
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
          child: AppBar(
            shape: const Border.symmetric(
              horizontal: BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: bannerRepository.getBannerDetail(int.parse(id)),
          builder: (context, AsyncSnapshot<BannerModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final banner = snapshot.data;
              return CachedNetworkImage(
                imageUrl: banner!.imageDetail,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    color: ColorConfig.primaryColor,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
