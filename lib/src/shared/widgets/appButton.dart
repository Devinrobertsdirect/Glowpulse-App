import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gradient_decoration.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final double? padding;
  final double? size;
  final bool? planColor;
  final Icon? icon;
  final bool? isLoading;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.padding,
    this.size,
    this.planColor,
    this.icon,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        8.r,
      ), // Ensures ripple effect is rounded
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            8.r,
          ), // Ensures InkWell has rounded corners
          child: Ink(
            width: double.infinity,
            decoration:
                planColor == true
                    ? BoxDecoration(color: Theme.of(context).primaryColor)
                    : getGradientDecoration(
                      context,
                    ).copyWith(borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(padding ?? 12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: icon ?? SizedBox(),
                    ),
                    isLoading == true
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                          title,
                          style:
                              size != null
                                  ? Theme.of(
                                    context,
                                  ).textTheme.labelMedium!.copyWith(
                                    fontSize: size,
                                    fontWeight: FontWeight.w700,
                                  )
                                  : Theme.of(context).textTheme.labelMedium!
                                      .copyWith(fontWeight: FontWeight.w700),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
