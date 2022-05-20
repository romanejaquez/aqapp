import 'package:aqapp/helpers/aqcolors.dart';
import 'package:flutter/material.dart';

class AQRoundButton extends StatelessWidget {
  
  final Function onTap;
  final String label;
  final EdgeInsets? margin; 
  const AQRoundButton({Key? key, this.margin, required this.onTap, required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Material(
        color: AQColors.mainGreen,
        borderRadius: BorderRadius.circular(50),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
            child: Text(this.label, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15))
          ),
        ),
      ),
    );
  }
}