import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watch_store/const/app_colors.dart';
import 'package:watch_store/const/app_typography.dart';
import 'package:watch_store/const/app_utils.dart';
import 'package:watch_store/const/extensions/extension_sizebox.dart';
import 'package:watch_store/model/watch_model.dart';
import 'package:watch_store/provider/watch_provider.dart'; // import your model

class DetailView extends StatelessWidget {
  final WatchModel watch; // 👈 hold the selected watch

  const DetailView({super.key, required this.watch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(watch.watchName)), // example usage
      body: Padding(
        padding: kPagePadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vSpace,
              Center(
                child: Image.asset(
                  watch.watchImage,
                  height: 300.h,
                ),
              ),
              50.vSpace,
              Consumer(
                builder: (context, ref, child) {
                  final images = ref.watch(
                    watchProvider.select(
                      (list) => list.take(3).map((w) => w.watchImage).toList(),
                    ),
                  );
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: index == 1
                                    ? const Color.fromARGB(255, 4, 18, 40)
                                    : Colors.transparent),
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            images[index],
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              50.vSpace,
              Text(watch.watchName, style: AppTypography.kBold22),
              5.vSpace,
              Text(
                  "${watch.watchName} the watch with many right anlges and the build by OMEGA company. Comes with with many features.",
                  style:
                      AppTypography.kMedium14.copyWith(color: AppColors.kGrey)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "USD \$${watch.price}",
                    style: AppTypography.kBold22,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.kBlack),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.shop,
                          color: Colors.white,
                        ),
                        10.hSpace,
                        Text(
                          'Add to Cart',
                          style: AppTypography.kMedium16
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              30.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
