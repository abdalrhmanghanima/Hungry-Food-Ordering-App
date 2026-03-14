import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;
  final bool isSelected;

  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(height: 85, width: 110, color: AppColors.primary),
        ),

        /// صورة التوبينج
        Positioned(
          top: -40,
          right: -5,
          left: -5,
          child: SizedBox(
            height: 80,
            width: 70,
            child: Card(
              color: isSelected ? Colors.green.shade200 : Colors.white,
              child: Image.network(imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),

        /// الاسم + زرار الإضافة
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: isSelected ? Colors.green : Colors.red,
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
