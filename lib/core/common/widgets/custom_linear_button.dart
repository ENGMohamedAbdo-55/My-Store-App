import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/context_extensions.dart';

class CustomLinearButton extends StatelessWidget {
  const CustomLinearButton({
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
    super.key,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.colors.bluePinkLight!.withOpacity(0.3),
      onTap: onPressed,
      child: Container(
        height: height ?? 44.h,
        width: width ?? 44.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          gradient: LinearGradient(
            colors: [
              context.colors.bluePinkLight!,
              context.colors.bluePinkDark!,
            ],
            begin: const Alignment(0.46, -0.89),
            end: const Alignment(-0.46, 0.89),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
