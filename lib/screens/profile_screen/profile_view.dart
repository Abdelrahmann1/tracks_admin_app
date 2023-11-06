import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/screens/profile_screen/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => const ProfileView(),
      viewModel: ProfileViewModel(),
    );
  }
}

class ProfileView extends HookView<ProfileViewModel> {
  const ProfileView({Key? key, reactive = true});

  @override
  Widget render(context, viewModel) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              viewModel.signOut();
            },
            child: const Text('Log Out'),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.exportData();
            },
            child: const Text('Export CSV'),
          ),
        ],
      ),
    ).setPageHorizontalPadding(context));
  }
}
