import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:tracks_admin_app/utils/app_colors.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;
  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 250,
        child:  Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: const Text("Start Now",style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 20),)
        // Stack(children: [
        //   RiveAnimation.asset(
        //     "assets/RiveAssets/button.riv",
        //     controllers: [_btnAnimationController],
        //   ),
        //   const Positioned.fill(
        //       top: 8,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(CupertinoIcons.arrow_right),
        //           SizedBox(
        //             width: 8,
        //           ),
        //           Text("Start now",
        //               style: TextStyle(fontWeight: FontWeight.w600)),
        //         ],
        //       )),
        // ]),
      ),
    ));
  }
}
