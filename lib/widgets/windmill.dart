import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Windmill extends StatefulWidget {

  final int speed;
  const Windmill({Key? key, required this.speed }) : super(key: key);

  @override
  State<Windmill> createState() => _WindmillState();
}

class _WindmillState extends State<Windmill> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.speed)
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 500,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/imgs/aq_base.svg',
              height: 300
            )
          ),
          Positioned(
            bottom: 80,
            left: 0, right: 0,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(parent: controller, curve: Curves.linear)),
                child: SvgPicture.asset('assets/imgs/aq_propeller.svg',
                width: 450,
                height: 450,
                fit: BoxFit.contain
              )
            )
          )
        ],
      )
    );
  }
}