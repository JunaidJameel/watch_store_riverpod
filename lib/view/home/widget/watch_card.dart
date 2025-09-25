import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_store/const/app_colors.dart';
import 'package:watch_store/const/app_typography.dart';
import 'package:watch_store/const/app_utils.dart';
import 'package:watch_store/const/extensions/extension_sizebox.dart';
import 'package:watch_store/model/watch_model.dart';
import 'package:watch_store/provider/watch_provider.dart';
import 'package:watch_store/view/home/detail.dart';

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
          final watch = watches[index];

          return _WatchItemCard(watch: watch); // delegate card building
        },
      ),
    );
  }
}

class _WatchItemCard extends StatelessWidget {
  final WatchModel watch;
  const _WatchItemCard({required this.watch});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailView(watch: watch)),
      ),
      child: Container(
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
                color: AppColors.kGrey.withValues(alpha: .15),
              ),
              margin: const EdgeInsets.only(top: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: kPagePadding,
                    child: Text(
                      watch.watchName,
                      style: AppTypography.kBold16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  10.vSpace,
                  Text(
                    'USD \$${watch.price}',
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  20.vSpace,
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                watch.watchImage,
                height: 280.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
