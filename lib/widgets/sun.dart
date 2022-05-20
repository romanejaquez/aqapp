import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sun extends StatefulWidget {
  Sun({Key? key}) : super(key: key);

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30)
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.linear)),
      child: SvgPicture.asset('assets/imgs/aq_sun.svg')
    );
  }
}