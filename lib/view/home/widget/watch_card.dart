import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watch_store/const/app_colors.dart';
import 'package:watch_store/const/app_utils.dart';
import 'package:watch_store/const/extensions/extension_sizebox.dart';
import 'package:watch_store/provider/watch_provider.dart';

class WatchCardWidget extends ConsumerWidget {
  const WatchCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watches = ref.watch(watchProvider); // just watch list length

    return Expanded(
      child: ListView.separated(
        padding: kPagePadding,
        scrollDirection: Axis.horizontal,
        itemCount: watches.length,
        separatorBuilder: (_, __) => 20.hSpace,
        itemBuilder: (_, index) {
          return _WatchItemCard(index: index); // delegate card building
        },
      ),
    );
  }
}

class _WatchItemCard extends ConsumerWidget {
  final int index;
  const _WatchItemCard({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Building card for index: $index'); // 👈 track rebuilds

    // only rebuild when THIS index changes
    final watch = ref.watch(
      watchProvider.select((list) => list[index]),
    );

    return Container(
      height: 100,
      width: 220.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.kGrey.withValues(alpha: .5),
            ),
            margin: const EdgeInsets.only(top: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(watch.watchName),
                5.vSpace,
                Text('USD \$${watch.price}'),
                20.vSpace,
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              watch.watchImage,
              height: 300.h,
            ),
          )
        ],
      ),
    );
  }
}
