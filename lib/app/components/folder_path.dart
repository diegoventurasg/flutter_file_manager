import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../themes/app_colors.dart';

class FolderPath extends StatelessWidget {
  FolderPath({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 25,
        child: Row(
          children: [
            const Icon(Icons.folder, color: AppColors.pathIcon),
            const SizedBox(
                width: 16,
                child: Icon(Icons.arrow_right, color: AppColors.path)),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => const Center(
                    child:
                        Text('folder', style: TextStyle(color: AppColors.path)),
                  ),
                  separatorBuilder: (_, __) => const Icon(
                    Icons.arrow_right,
                    color: AppColors.path,
                  ),
                  itemCount: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
