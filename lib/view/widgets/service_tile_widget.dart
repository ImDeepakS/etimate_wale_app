import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key? key,
    required this.width,
    required this.height,
    required this.header,
    required this.footer,
  }) : super(key: key);

  final double width;
  final double height;
  final String header;
  final String footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 220,
        left: 15,
        right: 20,
      ),
      child: Container(
        width: width / 1.1,
        height: height / 4,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: black.withOpacity(0.4),
              offset: Offset(0.5, 0.5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    header,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: mainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Container(
                    height: height / 8.5,
                    width: width / 8.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: shadyGrey.withOpacity(0.4),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/phone.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 0.5,
                width: width / 9,
                color: dimGrey,
              ),
            ),
            Container(
              width: width / 1.2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      footer,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: mainColor1,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: mainColor1,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
