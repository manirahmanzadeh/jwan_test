import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwan_test/src/core/constants/app_colors.dart';
import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';

class ServiceComponent extends StatelessWidget {
  const ServiceComponent({
    super.key,
    required this.service,
    required this.onTap,
    required this.selected,
  });

  final ServiceEntity service;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: selected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary,
            ),
            child: SvgPicture.network(
              service.icon.split('?').first,
              height: 40,
              width: 40,
              color: selected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            service.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.labelColor,
                ),
          ),
        ],
      ),
    );
  }
}
