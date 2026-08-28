part of 'check_connection_cubit.dart';

@freezed
class CheckConnectionState with _$CheckConnectionState {
  const factory CheckConnectionState.connected() = _Connected;
  const factory CheckConnectionState.disconnected() = _Disconnected;
}
