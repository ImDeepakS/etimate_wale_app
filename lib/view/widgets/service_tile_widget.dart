import 'package:fix_team_app/view/app/forms/estimate_price.dart';
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
        top: 240,
        left: 15,
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstimatePricePage(),
            ),
          );
        },
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 0.5,
                      width: width / 9,
                      color: dimGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 8,
                    ),
                    child: SizedBox(
                      width: width / 1.5,
                      child: Text(
                        footer,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: mainColor1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Container(
                  height: height / 6,
                  width: width / 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainColor,
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
        ),
      ),
    );
  }
}
