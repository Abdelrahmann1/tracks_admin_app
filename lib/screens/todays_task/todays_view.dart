import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';
import 'package:tracks_admin_app/screens/todays_task/today_view_model.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

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
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Welcome",
                style:
                    TextStyle(color: AppColors.shadowColorLight, fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Employee Name",
                style: TextStyle(
                    color: AppColors.shadowColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Today's Status",
                style: TextStyle(
                    color: AppColors.shadowColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 30),
              height: 150,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Check In ",
                        style:
                            TextStyle(fontSize: 18, color: AppColors.green),
                      ),
                      Text("09:30 ",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.black54,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Check Out",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.red)),
                      Text("--/-- ",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.black54,
                              )),
                    ],
                  )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child:
            RichText(
              text: const TextSpan(
                text: "26",
                style: TextStyle(color: AppColors.primaryColor , fontSize: 25 ,fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "  Oct 2024",
                    style: TextStyle(
                      color: AppColors.shadowColorDark,
                      fontSize: 20,

                    )
                  )
                ]
              ),

            )
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "12:00:01 PM",
                style: TextStyle(
                  fontSize: 20,
                    color: AppColors.black54, fontWeight: FontWeight.bold),
              ),
            ),
            Builder(builder: (context){
              final GlobalKey<SlideActionState> key = GlobalKey();
              return SlideAction(
                text: "Slide To Check Out",
                textStyle: const TextStyle( color: AppColors.black54 ,fontSize: 18),
                outerColor: AppColors.white,
                innerColor: AppColors.primaryColor,
                key: key,
                onSubmit: (){},
              );
            }),
            Text("")

          ],
        ),
      ),
    )).setPageHorizontalPadding(context);
  }
}
