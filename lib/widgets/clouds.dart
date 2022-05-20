import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Clouds extends StatefulWidget {
  const Clouds({Key? key}) : super(key: key);

  @override
  State<Clouds> createState() => _CloudsState();
}

class _CloudsState extends State<Clouds> with TickerProviderStateMixin {

  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10)
    )..repeat();

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60)
    )..repeat();

    controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30)
    )..repeat();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.50),
            end: Offset(MediaQuery.of(context).size.width / 150, 0.50)
          ).animate(CurvedAnimation(parent: controller1, curve: Curves.linear)
          ),
          child:  SvgPicture.asset(
            'assets/imgs/aq_cloud1.svg',
            width: 150,
          )
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 1.0),
            end: Offset(MediaQuery.of(context).size.width / 350, 1.0)
          ).animate(CurvedAnimation(parent: controller2, curve: Curves.linear)
          ),
          child:  SvgPicture.asset(
            'assets/imgs/aq_cloud2.svg',
            width: 350,
          )
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 2.0),
            end: Offset(MediaQuery.of(context).size.width / 250, 2.0)
          ).animate(CurvedAnimation(parent: controller3, curve: Curves.linear)
          ),
          child:  Opacity(
            opacity: 0.5,
            child: SvgPicture.asset(
              'assets/imgs/aq_cloud2.svg',
              width: 250,
            ),
          )
        )
      ],
    );
  }
}