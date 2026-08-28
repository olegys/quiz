import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../themes/app_colors.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../widgets/custom_text_field.dart';

class AmountDialog extends StatefulWidget {
  final int amount;

  const AmountDialog({
    super.key,
    required this.amount,
  });

  @override
  State<AmountDialog> createState() => _AmountDialogState();
}

class _AmountDialogState extends State<AmountDialog> {
  late int _amount = widget.amount;

  void _onChanged(String value) {
    setState(() {
      _amount = int.tryParse(value) ?? 0;
    });
  }

  void _back() {
    SmartDialog.dismiss();
  }

  void _save() {
    SmartDialog.dismiss(result: _amount);
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Container(
      color: AppColors.backgroundOne,
      padding: EdgeInsets.only(
        top: 10.0.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10.0.h,
      ),
      child: SeparatedRow(
        mainAxisAlignment: MainAxisAlignment.center,
        separatorBuilder: () => SizedBox(
          width: 10.0.w,
        ),
        children: [
          CustomIconButton(
            icon: Assets.icons.close.path,
            backgroundColor: AppColors.backgroundTwo,
            onPressed: _back,
          ),
          SizedBox(
            width: 512.0.w,
            child: CustomTextField(
              onChanged: _onChanged,
              initialValue: '$_amount',
              defaultValue: '10',
              autofocus: true,
              labelText: tr.numberOfQuestions,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(
                  RegExp(r'^0'),
                ),
              ],
            ),
          ),
          CustomIconButton.orange(
            icon: Assets.icons.check.path,
            onPressed: _amount >= 5 && _amount <= 50 ? _save : null,
          ),
        ],
      ),
    );
  }
}
