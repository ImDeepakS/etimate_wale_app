import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselContainerWidget extends StatelessWidget {
  final Color? secondColor;
  final String? slider;
  final EdgeInsetsGeometry? padd;
  final String? text;
  const CarouselContainerWidget({
    Key? key,
    this.text,
    this.secondColor,
    this.slider,
    this.padd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 70),
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            white,
            secondColor!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: padd!,
              child: Image(
                image: AssetImage(slider!),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(
                top: 70,
                left: 20,
              ),
              child: SizedBox(
                width: width / 1.7,
                child: Text(
                  text!,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        offset: Offset(0.5, 0.5),
                        color: black.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
