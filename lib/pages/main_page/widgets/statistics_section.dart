import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../i18n/strings.g.dart';
import '../../../logic/user_cubit/user_cubit.dart';
import 'statistics_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return SeparatedRow(
          separatorBuilder: () => SizedBox(width: 7.0.w),
          children: [
            StatisticsCard(
              icon: '🏆',
              value: '${state.winRate}%',
              title: tr.winRate,
            ),
            StatisticsCard(
              icon: '👎',
              value: '${state.lossRate}%',
              title: tr.lossRate,
            ),
            StatisticsCard(
              icon: '📒',
              value: '${state.totalDone}',
              title: tr.totalDone,
            ),
          ],
        );
      },
    );
  }
}
