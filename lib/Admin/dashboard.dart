import 'package:flutter/material.dart';
import 'package:tracks_admin_app/Admin/pages/home/home_page.dart';
import 'package:tracks_admin_app/Admin/responsive.dart';
import 'package:tracks_admin_app/Admin/widgets/menu.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Menu(scaffoldKey: _scaffoldKey),
                ),
              ),
            Expanded(flex: 8, child: HomePage(scaffoldKey: _scaffoldKey)),
          ],
        ),
      ),
    );
  }
}
