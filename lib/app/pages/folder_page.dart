import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/folder_path.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          FolderPath(),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (_, __) => InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text('Item', style: AppTextStyles.listItemTitle),
                    subtitle:
                        Text('subitem', style: AppTextStyles.listItemSubtitle),
                    leading: SizedBox(
                      height: double.infinity,
                      child: Icon(
                        Icons.folder_open_rounded,
                        color: AppColors.folderItemIcon,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(
                  indent: 68,
                  endIndent: 16,
                  height: 1,
                  thickness: 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
