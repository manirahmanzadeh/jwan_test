import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwan_test/src/core/constants/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(color: AppColors.searchBG, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/home/search.svg',
            width: 20,
            height: 20,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 28,
            maxWidth: 28,
            minHeight: 20,
            maxHeight: 20,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/home/filter.svg',
              width: 20,
              height: 20,
            ),
          ),
          labelText: 'جستجو',
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.searchLabel),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
