import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import '../text_icon.dart';
import 'custom_icon_button.dart';
import 'custom_tap.dart';

class CustomButton extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final Duration _duration = const Duration(milliseconds: 200);
  bool _isPressed = false;

  void _onTapDown(_) {
    if (widget.onPressed != null) {
      setState(() => _isPressed = true);
    }
  }

  void _onTapUp(_) {
    if (widget.onPressed != null) {
      setState(() => _isPressed = false);
    }
  }

  void _onTapCancel() {
    if (widget.onPressed != null) {
      setState(() => _isPressed = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = widget.onPressed == null;

    return CustomTap(
      onTap: widget.onPressed,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedOpacity(
        opacity: isDisabled
            ? 0.3
            : _isPressed
                ? 0.6
                : 1.0,
        duration: _duration,
        child: Container(
          padding: EdgeInsets.all(10.0.r).copyWith(left: 30.0.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0.r),
            color: AppColors.backgroundOne,
          ),
          child: SeparatedRow(
            separatorBuilder: () => SizedBox(
              width: 10.0.w,
            ),
            children: [
              TextIcon(
                icon: widget.icon,
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.accentTwo,
                  ),
                ),
              ),
              CustomIconButton(
                icon: Assets.icons.chevronRight.path,
                onPressed: widget.onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
