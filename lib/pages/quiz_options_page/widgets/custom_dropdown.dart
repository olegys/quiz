import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../gen/assets.gen.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_shadows.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/buttons/custom_tap.dart';
import '../../../widgets/custom_svg.dart';

class CustomDropdown<T> extends StatefulWidget {
  final T? initialValue;
  final String title;
  final List<DropdownMenuEntry<T>> values;
  final ValueChanged<T> onSelected;

  const CustomDropdown({
    super.key,
    this.initialValue,
    required this.title,
    required this.values,
    required this.onSelected,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  final GlobalKey _scrollKey = GlobalKey();
  final ScrollController _controller = ScrollController();
  bool _isOpen = false;

  Future<void> _showDropdown(BuildContext context) async {
    setState(() => _isOpen = true);

    await SmartDialog.showAttach(
      targetContext: context,
      bindWidget: context,
      usePenetrate: true,
      useAnimation: true,
      adjustBuilder: (AttachParam attachParam) => AttachAdjustParam(
        builder: (_) => Container(
          margin: EdgeInsets.all(30.0.r).copyWith(top: 0.0),
          width: attachParam.targetSize.width,
          child: attachParam.selfWidget,
        ),
      ),
      animationBuilder: (controller, child, animationParam) => SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: CurvedAnimation(
          parent: controller,
          curve: Curves.easeOut,
        ),
        child: child,
      ),
      builder: (_) => _createDropdown(),
    );

    if (mounted) {
      setState(() => _isOpen = false);
    }
  }

  Widget _createDropdown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int index =
          widget.values.indexWhere((e) => e.value == widget.initialValue);
      final double offset = index * 40.0.r;

      _controller.jumpTo(min(offset, _controller.position.maxScrollExtent));

      Future.delayed(const Duration(milliseconds: 100)).then((_) {
        Scrollable.ensureVisible(
          _scrollKey.currentContext!,
          alignment: 0.05,
        );
      });
    });

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      constraints: BoxConstraints(
        maxHeight: 154.0.h,
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.shadowTwo,
        color: AppColors.backgroundTwo,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0.r),
        ),
        border: Border(
          left: BorderSide(
            width: 1.0.r,
            color: AppColors.accentOne,
          ),
          right: BorderSide(
            width: 1.0.r,
            color: AppColors.accentOne,
          ),
          bottom: BorderSide(
            width: 1.0.r,
            color: AppColors.accentOne,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0.r),
        ),
        child: RawScrollbar(
          thickness: 6.0.w,
          radius: Radius.circular(3.0.r),
          padding: EdgeInsets.all(3.0.r),
          minThumbLength: 40.0.h,
          thumbColor: AppColors.layerThree,
          child: ListView.separated(
            controller: _controller,
            shrinkWrap: true,
            itemCount: widget.values.length,
            padding: EdgeInsets.symmetric(
              vertical: 10.0.h,
              horizontal: 18.0.w,
            ),
            separatorBuilder: (_, __) => SizedBox(
              height: 8.0.h,
            ),
            itemBuilder: (context, index) => CustomTap(
              key: widget.initialValue == widget.values[index].value
                  ? _scrollKey
                  : null,
              onTap: () {
                widget.onSelected(widget.values[index].value);
                SmartDialog.dismiss();
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.values[index].label,
                      style: widget.initialValue == widget.values[index].value
                          ? AppTextStyles.medium16.copyWith(
                              color: AppColors.accentOne,
                            )
                          : AppTextStyles.light16,
                    ),
                  ),
                  Opacity(
                    opacity: widget.initialValue == widget.values[index].value
                        ? 1.0
                        : 0.0,
                    child: CustomSvg(
                      Assets.icons.check.path,
                      color: AppColors.accentOne,
                      size: 24.0.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: _isOpen ? SmartDialog.dismiss : () => _showDropdown(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 62.0.h,
        decoration: BoxDecoration(
          boxShadow: _isOpen ? AppShadows.shadowTwo : [],
          color: AppColors.backgroundTwo,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0.r),
            bottom: Radius.circular(_isOpen ? 0.0 : 30.0.r),
          ),
          border: Border.all(
            width: 1.0.r,
            color: _isOpen ? AppColors.accentOne : AppColors.layerFive,
          ),
        ),
        child: PaddedRow(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0.w,
          ),
          children: [
            Expanded(
              child: PaddedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0.h,
                ),
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.layerOne,
                    ),
                  ),
                  Text(
                    '${widget.values.singleWhereOrNull((e) => e.value == widget.initialValue)?.label}',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.medium16,
                  ),
                ],
              ),
            ),
            AnimatedRotation(
              turns: _isOpen ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: CustomSvg(
                Assets.icons.chevronDown.path,
                color: AppColors.accentThree,
                size: 24.0.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
