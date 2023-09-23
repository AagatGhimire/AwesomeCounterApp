import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
          appNotifications: false,
          emailNotifications: false,
        ));

  void toggleAppNotification(bool newValue) {
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotification(bool newValue) {
    emit(state.copyWith(emailNotifications: newValue));
  }
}
