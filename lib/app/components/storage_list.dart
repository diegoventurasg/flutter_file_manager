import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

enum StorageBorderRadius { all, top, bottom, none }

class StorageList extends StatelessWidget {
  const StorageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Armazenamento',
            style: AppTextStyles.listTitle,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[900],
          ),
          child: Center(
            child: Column(
              children: [
                StorageItem(
                  title: 'Armazenamento interno',
                  icon: Icons.phone_android,
                  onTap: () => Navigator.of(context).pushNamed('/folder'),
                  iconColor: AppColors.internalStorageIcon,
                  storageBorderRadius: StorageBorderRadius.top,
                ),
                const Divider(color: AppColors.divider, height: 2, indent: 52),
                StorageItem(
                  title: 'Armazenamento de rede',
                  icon: Icons.storage,
                  onTap: () {},
                  iconColor: AppColors.networkStorageIcon,
                  storageBorderRadius: StorageBorderRadius.bottom,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StorageItem extends StatelessWidget {
  const StorageItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.blue,
    this.storageBorderRadius = StorageBorderRadius.none,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() onTap;
  final Color iconColor;
  final StorageBorderRadius storageBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: storageBorderRadius == StorageBorderRadius.none
              ? BorderRadius.zero
              : BorderRadius.only(
                  topLeft: storageBorderRadius == StorageBorderRadius.top
                      ? const Radius.circular(20)
                      : Radius.zero,
                  topRight: storageBorderRadius == StorageBorderRadius.top
                      ? const Radius.circular(20)
                      : Radius.zero,
                  bottomLeft: storageBorderRadius == StorageBorderRadius.bottom
                      ? const Radius.circular(20)
                      : Radius.zero,
                  bottomRight: storageBorderRadius == StorageBorderRadius.bottom
                      ? const Radius.circular(20)
                      : Radius.zero,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, size: 28, color: iconColor),
              const SizedBox(width: 8),
              Text(title, style: AppTextStyles.storageItem),
            ],
          ),
        ),
      ),
    );
  }
}
