import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/screens/Calendar_Screen/calendar_screen_view_model.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => const CalenderView(),
      viewModel: CalenderScreenViewModel(),
    );
  }
}

class CalenderView extends HookView<HomeViewModel> {
  const CalenderView({Key? key, reactive = true});

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Calender Screen"),
          ],
        ),
      ).setPageHorizontalPadding(context),
    );
  }
}
 // LogOut Funcation
// MaterialButton(
// onPressed: () async {
// final SharedPreferences prefs =
// await SharedPreferences.getInstance();
// await prefs.remove('EmployeeEmail');
// SystemNavigator.pop();
// },
// child:
// Container(color: Colors.red, child: const Text("Log Out")))
