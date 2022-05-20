import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Trees extends StatefulWidget {
  Trees({Key? key}) : super(key: key);

  @override
  State<Trees> createState() => _TreesState();
}

class _TreesState extends State<Trees> with SingleTickerProviderStateMixin {

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
    return SizedBox(
      width: 600,
      height: 400,
      child: Stack(
        children: [
          Positioned(
            left: 110,
            bottom: -10,
            child: SvgPicture.asset('assets/imgs/aq_tree_sm.svg')
          ),
          Positioned(
            left: 200,
            bottom: -10,
            child: SvgPicture.asset('assets/imgs/aq_tree_lg.svg')
          ),
          Positioned(
            left: 420,
            bottom: -10,
            child: SvgPicture.asset('assets/imgs/aq_tree_md.svg')
          ),
        ],
      )
    );
  }
}