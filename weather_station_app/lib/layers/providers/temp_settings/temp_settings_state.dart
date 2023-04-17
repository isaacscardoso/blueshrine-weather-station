part of './temp_settings_provider_impl.dart';

class TempSettingsState extends Equatable {
  final TempScale tempScale;

  const TempSettingsState({this.tempScale = TempScale.celsius});

  factory TempSettingsState.initial() {
    return const TempSettingsState();
  }

  TempSettingsState copyWith({TempScale? tempScale}) {
    return TempSettingsState(tempScale: tempScale ?? this.tempScale);
  }

  @override
  List<Object?> get props => [tempScale];
}
