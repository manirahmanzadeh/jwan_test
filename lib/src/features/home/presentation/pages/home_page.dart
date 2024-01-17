import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/core/constants/app_colors.dart';
import 'package:jwan_test/src/features/home/presentation/components/search_bar.dart';
import 'package:jwan_test/src/features/home/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/home/group.svg'),
          ),
          title: Text(
            'خدمات',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.titleColor,
                ),
          ),
        ),
        body: Column(
          children: [AppSearchBar()],
        ));
  }
}
