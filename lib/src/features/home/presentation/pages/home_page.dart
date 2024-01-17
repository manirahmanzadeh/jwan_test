import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/core/constants/app_colors.dart';
import 'package:jwan_test/src/features/home/presentation/components/reserve_button.dart';
import 'package:jwan_test/src/features/home/presentation/components/search_bar.dart';
import 'package:jwan_test/src/features/home/presentation/components/service_component.dart';
import 'package:jwan_test/src/features/home/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/home/more.svg',
                width: 28,
                height: 28,
              ),
            ),
          ),
        ],
        title: Text(
          'خدمات',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.titleColor,
              ),
        ),
      ),
      body: Column(
        children: [
          const AppSearchBar(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'خدمات',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'نمایش همه',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => Expanded(
              child: controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: controller.services.length, // Replace with your actual item count
                        itemBuilder: (context, index) {
                          // Replace this container with your custom item widget
                          return Obx(
                            () => ServiceComponent(
                              service: controller.services[index],
                              onTap: () => controller.selectService(controller.services[index]),
                              selected: controller.selectedServices.contains(controller.services[index]),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
          Obx(
            () => ReserveButton(
              loading: controller.isSending.isTrue,
              onTap: controller.sendServices,
            ),
          )
        ],
      ),
    );
  }
}
