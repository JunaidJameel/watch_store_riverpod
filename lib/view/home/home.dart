import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watch_store/const/app_colors.dart';
import 'package:watch_store/const/app_utils.dart';
import 'package:watch_store/const/extensions/extension_sizebox.dart';
import 'package:watch_store/provider/watch_provider.dart';
import 'package:watch_store/view/home/widget/filter_widget.dart';
import 'package:watch_store/view/home/widget/watch_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Iconsax.menu_board),
        centerTitle: true,
        title: Text(
          'OMEGA',
          style: GoogleFonts.merriweather(
              fontSize: 24.sp, fontWeight: FontWeight.w800, letterSpacing: 1),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.vSpace,
            Padding(
              padding: kPagePadding,
              child: Text('Explore',
                  style: GoogleFonts.oswald(
                      fontSize: 28.sp, fontWeight: FontWeight.w400)),
            ),
            5.vSpace,
            Padding(
              padding: kPagePadding,
              child: Text('Top BRANDS WATCHES',
                  style: GoogleFonts.oswald(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
            ),
            40.vSpace,
            Consumer(builder: (context, ref, child) {
              return FilterWidget(
                options: [
                  "Trending",
                  "Popular",
                  "New",
                  "Best Seller",
                ],
                onChanged: (index) {
                  final selectedCategory = [
                    "Trending",
                    "Popular",
                    "New",
                    "Best Seller",
                  ][index];

                  ref.read(watchProvider.notifier).filter(selectedCategory);
                },
              );
            }),
            40.vSpace,
            WatchCardWidget(),
            80.vSpace,
          ],
        ),
      ),
    );
  }
}
