import 'package:awesome_counter_app/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackbar = SnackBar(
            content: Text(
                'App ${state.appNotifications.toString().toUpperCase()}, Email ${state.emailNotifications.toString().toUpperCase()}'),
          );
          final scaffoldMessenger = ScaffoldMessenger.of(context);
          scaffoldMessenger.removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackbar);
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Column(children: [
              SwitchListTile(
                value: state.appNotifications,
                onChanged: (newValue) {
                  context.read<SettingsCubit>().toggleAppNotification(newValue);
                },
                title: const Text('App Notification'),
              ),
              SwitchListTile(
                value: state.emailNotifications,
                onChanged: (newValue) {
                  context
                      .read<SettingsCubit>()
                      .toggleEmailNotification(newValue);
                },
                title: const Text('Email Notification'),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
