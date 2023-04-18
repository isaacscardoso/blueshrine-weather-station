import 'package:equatable/equatable.dart';

import './enums/enums.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() => const ThemeState();

  ThemeState copyWith({AppTheme? appTheme}) {
    return ThemeState(appTheme: appTheme ?? this.appTheme);
  }

  @override
  List<Object?> get props => [appTheme];
}
