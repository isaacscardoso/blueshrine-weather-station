import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import './itemp_settings_provider.dart';

import './enums/enums.dart';

part './temp_settings_state.dart';

class TempSettingsProviderImpl extends StateNotifier<TempSettingsState> implements ITempSettingsProvider {
  TempSettingsProviderImpl() : super(TempSettingsState.initial());

  @override
  void toggleTempScale() {
    state = state.copyWith(
      tempScale: state.tempScale == TempScale.celsius
          ? TempScale.fahrenheit
          : TempScale.celsius,
    );
  }
}
