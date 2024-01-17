import 'package:flutter/material.dart';

class ReserveButton extends StatelessWidget {
  const ReserveButton({
    super.key,
    required this.loading,
    required this.onTap,
  });

  final bool loading;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
          foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(18)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0), // Adjust the value as needed
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              const CircularProgressIndicator(
                color: Colors.white,
              )
            else
              Text(
                'رزرو',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
