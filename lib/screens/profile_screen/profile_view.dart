import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';
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

class ProfileView extends HookView<HomeViewModel> {
  const ProfileView({Key? key, reactive = true});

  @override
  Widget render(context, viewModel) {
    return  Scaffold(
      body:  const Center(
      child: Text("Profile Screen")
      ).setPageHorizontalPadding(context),

    );
  }
}
