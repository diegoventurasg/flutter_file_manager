import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Categorias',
            style: AppTextStyles.listTitle,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.background,
          ),
          child: Center(
            child: Wrap(
              runSpacing: 20,
              spacing: 10,
              children: [
                CategoryItem(
                  title: "Imagens",
                  icon: Icons.image,
                  onTap: () {},
                  iconColor: AppColors.imagesIcon,
                ),
                CategoryItem(
                  title: "Vídeos",
                  icon: Icons.ondemand_video,
                  onTap: () {},
                  iconColor: AppColors.videosIcon,
                ),
                CategoryItem(
                  title: "Arquivos de áudio",
                  icon: Icons.music_note,
                  onTap: () {},
                  iconColor: AppColors.audiosIcon,
                ),
                CategoryItem(
                  title: "Documentos",
                  icon: Icons.file_copy,
                  onTap: () {},
                  iconColor: AppColors.documentsIcon,
                ),
                CategoryItem(
                  title: "Downloads",
                  icon: Icons.download,
                  onTap: () {},
                  iconColor: AppColors.downloadsIcon,
                ),
                CategoryItem(
                  title: "Arq. de instação",
                  icon: Icons.android,
                  onTap: () {},
                  iconColor: AppColors.installationIcon,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.blue,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 100,
          ),
          child: Column(
            children: [
              Icon(icon, size: 32, color: iconColor),
              const SizedBox(height: 8),
              Text(title, style: AppTextStyles.listItemTitle),
            ],
          ),
        ),
      ),
    );
  }
}
