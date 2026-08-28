import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'check_connection_cubit.freezed.dart';
part 'check_connection_state.dart';

class CheckConnectionCubit extends Cubit<CheckConnectionState> {
  late final StreamSubscription<InternetStatus> _subscription;
  late final AppLifecycleListener _listener;

  CheckConnectionCubit() : super(const CheckConnectionState.connected()) {
    _subscription = InternetConnection().onStatusChange.listen(
          checkConnection,
        );

    _listener = AppLifecycleListener(
      onResume: _subscription.resume,
      onHide: _subscription.pause,
      onPause: _subscription.pause,
    );
  }

  Future<void> checkConnection([InternetStatus? status]) async {
    final bool isConnected = status != null
        ? status == InternetStatus.connected
        : await InternetConnection().hasInternetAccess;

    if (isConnected) {
      emit(
        const CheckConnectionState.connected(),
      );
    } else {
      emit(
        const CheckConnectionState.disconnected(),
      );
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _listener.dispose();
    return super.close();
  }
}
