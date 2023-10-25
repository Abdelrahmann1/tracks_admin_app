import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:tracks_admin_app/extentions/padding_ext.dart';
import 'package:tracks_admin_app/screens/Calendar_Screen/calendar_screen_view.dart';
import 'package:tracks_admin_app/screens/Home/home_view_model.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

import '../profile_screen/profile_view.dart';
import '../todays_task/todays_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => const HomeView(),
      viewModel: HomeViewModel(),
    );
  }
}

class HomeView extends HookView<HomeViewModel> {
  const HomeView({Key? key, reactive = true});

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentIndex,

        children: const [
          CalenderScreen(),
          TodayScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 10, offset: Offset(2, 3)),
            ]),
        child: ClipRect(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0;
                  i < viewModel.navigationIcons.length;
                  i++) ...<Expanded>{
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    viewModel.onIconChanged(i);
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          viewModel.navigationIcons[i],
                          color: i == viewModel.currentIndex
                              ? AppColors.primaryColor
                              : AppColors.shadowColorDark,
                          size: i == viewModel.currentIndex ? 30 : 25,
                        ),
                        i == viewModel.currentIndex ? Container(
                          margin: const EdgeInsets.only(top: 6),
                          height: 3,
                          width: 22,
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,

                              borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        ):const SizedBox(),

                      ],

                    ),
                  ),
                ))
              }
            ],
          ),
        ),
      ).setPageHorizontalPadding(context),
    );
  }
}
