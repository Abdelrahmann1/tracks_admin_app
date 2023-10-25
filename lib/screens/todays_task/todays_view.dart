import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';
import 'package:tracks_admin_app/screens/todays_task/today_view_model.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => const TodayView(),
      viewModel: TodayTaskViewModel(),
    );
  }
}

class TodayView extends HookView<HomeViewModel> {
  const TodayView({Key? key, reactive = true});

  @override
  Widget render(context, viewModel) {
    return const Scaffold(
      body: Center(child: Text("Todays Tasks")),
    ).setPageHorizontalPadding(context);
  }
}
