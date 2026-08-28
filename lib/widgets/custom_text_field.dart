import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import 'buttons/custom_tap.dart';
import 'custom_svg.dart';
import 'outlined_input_border.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? initialValue;
  final String? defaultValue;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? ignorePointers;
  final bool canRequestFocus;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.defaultValue,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.enabled,
    this.ignorePointers,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.onChanged,
    this.onTap,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(() {
      setState(() {});
    });

    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }

    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }

    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool showIcon = _controller.text.isNotEmpty;

    return SizedBox(
      height: 60.0.h,
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        cursorColor: AppColors.accentOne,
        cursorWidth: 2.0.w,
        cursorRadius: Radius.circular(2.0.r),
        textAlignVertical: TextAlignVertical.bottom,
        style: AppTextStyles.medium16,
        onChanged: widget.onChanged,
        controller: _controller,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap,
        enabled: widget.enabled,
        ignorePointers: widget.ignorePointers,
        canRequestFocus: widget.canRequestFocus,
        autofocus: widget.autofocus,
        focusNode: _focusNode,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelStyle: AppTextStyles.regular12.copyWith(
            fontSize: AppTextStyles.regular12.fontSize! * 1.35,
            color: AppColors.layerOne,
          ),
          labelStyle: AppTextStyles.light16.copyWith(
            color: AppColors.layerOne,
          ),
          hintStyle: AppTextStyles.light16.copyWith(
            color: AppColors.layerOne,
          ),
          filled: true,
          isDense: true,
          isCollapsed: true,
          fillColor: AppColors.backgroundTwo,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.0.w,
            vertical: 10.0.h,
          ),
          suffixIcon: showIcon
              ? CustomTap(
                  onTap: () {
                    _controller.text = widget.defaultValue ?? '';
                    widget.onChanged?.call(_controller.text);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.0.w,
                    ),
                    child: CustomSvg(
                      Assets.icons.close.path,
                      color: AppColors.accentThree,
                      size: 24.0.r,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(),
          enabledBorder: OutlinedInputBorder(
            borderRadius: BorderRadius.circular(30.0.r),
            borderSide: BorderSide(
              width: 1.0.r,
              color: AppColors.layerFive,
            ),
          ),
          focusedBorder: OutlinedInputBorder(
            borderRadius: BorderRadius.circular(30.0.r),
            borderSide: BorderSide(
              width: 1.0.r,
              color: AppColors.accentOne,
            ),
          ),
          disabledBorder: OutlinedInputBorder(
            borderRadius: BorderRadius.circular(30.0.r),
            borderSide: BorderSide(
              width: 1.0.r,
              color: AppColors.layerFive,
            ),
          ),
        ),
      ),
    );
  }
}
