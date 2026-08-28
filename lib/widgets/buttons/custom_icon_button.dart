import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_shadows.dart';
import '../custom_svg.dart';
import 'custom_tap.dart';

class CustomIconButton extends StatefulWidget {
  final String icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final VoidCallback? onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = AppColors.backgroundOne,
    this.borderColor = AppColors.layerFive,
    this.iconColor = AppColors.accentThree,
    this.onPressed,
  });

  factory CustomIconButton.orange({
    required String icon,
    VoidCallback? onPressed,
  }) {
    return CustomIconButton(
      icon: icon,
      backgroundColor: AppColors.accentOne,
      borderColor: AppColors.layerTwo,
      iconColor: AppColors.backgroundTwo,
      onPressed: onPressed,
    );
  }

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
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
          width: 60.0.r,
          height: 60.0.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor,
            boxShadow: AppShadows.shadowThree,
            border: Border.all(
              width: 1.0.r,
              color: widget.borderColor,
            ),
          ),
          child: CustomSvg(
            widget.icon,
            color: widget.iconColor,
            size: 24.0.r,
          ),
        ),
      ),
    );
  }
}
