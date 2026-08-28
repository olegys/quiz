import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTap extends StatelessWidget {
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;
  final Widget child;

  const CustomTap({
    super.key,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    required this.child,
  });

  void _onTap() {
    FocusManager.instance.primaryFocus?.unfocus();
    HapticFeedback.selectionClick();
    onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? _onTap : null,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
