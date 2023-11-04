import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/screens/Calendar_Screen/calendar_screen_view_model.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';
import 'package:animated_button/animated_button.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';
import '../../utils/app_router.dart';
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
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            AnimatedButton(
              color: AppColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.leadsScreen);
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
              child: const Text(
                'Leads',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedButton(
              color: AppColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.unitesScreen);

              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
              child: const Text(
                'Units',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]))),
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
