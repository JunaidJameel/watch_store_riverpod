import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:watch_store/const/app_colors.dart';
import 'package:watch_store/const/app_typography.dart';
import 'package:watch_store/const/app_utils.dart';
import 'package:watch_store/const/extensions/extension_sizebox.dart';
import 'package:watch_store/model/watch_model.dart';
import 'package:watch_store/provider/cart_provider.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(cartProvider.select((cart) => cart.length));
    final isEmpty = itemCount == 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Your Cart",
          style: AppTypography.kBold16,
        ),
      ),
      body: isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Padding(
              padding: kPagePadding,
              child: ListView.separated(
                  itemCount: itemCount,
                  separatorBuilder: (_, __) => 20.vSpace,
                  itemBuilder: (context, index) {
                    // Grab the list (non-reactive, for IDs only)
                    final cart = ref.read(cartProvider);
                    final watchId = cart[index].id;

                    // Safely watch the specific item by ID
                    final watch = ref.watch(
                      cartProvider.select(
                        (cart) =>
                            cart.where((w) => w.id == watchId).firstOrNull,
                      ),
                    );

                    if (watch == null) {
                      return const SizedBox.shrink();
                    }

                    return Dismissible(
                      key: ValueKey(watch.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) {
                        ref
                            .read(cartProvider.notifier)
                            .removeFromCart(watch.id);
                      },
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          children: [
                            Spacer(),
                            Icon(CupertinoIcons.delete, color: Colors.red),
                          ],
                        ),
                      ),
                      child: CartCard(watch: watch),
                    );
                  }),
            ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.watch});

  final WatchModel watch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(watch.watchImage),
            ),
          ),
        ),
        20.hSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              watch.watchName,
              style: AppTypography.kBold16.copyWith(color: Colors.black),
              maxLines: 2,
            ),
            8.vSpace,
            Text(
              "\$${watch.price}",
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                fontSize: 20.sp,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CheckoutCard extends ConsumerWidget {
  const CheckoutCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuilds when total price changes
    final total = ref.watch(
      cartProvider.select(
        (cart) => cart.fold<double>(0, (sum, item) => sum + item.price),
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withValues(alpha: 0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "Total: ",
                  style: GoogleFonts.oswald(fontSize: 20.sp),
                  children: [
                    TextSpan(
                      text: "\$${total.toStringAsFixed(2)}",
                      style: GoogleFonts.oswald(
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.kBlack,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: Text("Check Out", style: AppTypography.kMedium18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
