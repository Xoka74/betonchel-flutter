import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Widget child;

  final String? iconStart;
  final String? iconEnd;

  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.iconStart,
    this.iconEnd,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorsTheme;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: colors.backgroundPrimary,
        foregroundColor: colors.textPrimary,
        textStyle: const TextStyle(
          fontSize: 16,
        ),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: colors.textPrimary)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconStart != null)
                  SvgPicture.asset(
                    iconStart!,
                    colorFilter: ColorFilter.mode(
                      colors.textPrimary,
                      BlendMode.srcIn,
                    ),
                    height: 16,
                    width: 16,
                  ),
                const SizedBox(width: 4),
                child,
                const SizedBox(width: 4),
                if (iconEnd != null)
                  SvgPicture.asset(
                    iconEnd!,
                    colorFilter: ColorFilter.mode(
                      colors.textPrimary,
                      BlendMode.srcIn,
                    ),
                    height: 16,
                    width: 16,
                  ),
              ],
            ),
    );
  }
}
