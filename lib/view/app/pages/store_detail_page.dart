import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/app/pages/store_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreDetailsPage extends StatelessWidget {
  final String storeImage,
      storeName,
      storeAddress,
      storeUser,
      storeContact,
      storeEmail,
      storeExp;
  const StoreDetailsPage({
    Key? key,
    required this.storeImage,
    required this.storeName,
    required this.storeContact,
    required this.storeEmail,
    required this.storeExp,
    required this.storeUser,
    required this.storeAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "EstimateWale",
          style: GoogleFonts.poppins(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StorePage(),
                ),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: white,
          ),
          child: Column(
            children: [
              Container(
                height: height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(storeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                width: width,
                decoration: BoxDecoration(
                  color: mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: Offset(0.5, 0.5),
                    ),
                  ],
                ),
                child: Text(
                  storeName,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        LabelText(label: "Username : "),
                        Text(
                          storeUser,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        LabelText(label: "Address : "),
                        Text(
                          storeAddress,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        LabelText(label: "Contact : "),
                        Text(
                          storeContact,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        LabelText(label: "Email : "),
                        Text(
                          storeEmail,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        LabelText(label: "Shop Experience : "),
                        Text(
                          storeExp,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: mainColor1),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Reviews",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.4),
                            blurRadius: 5,
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainColor,
                                  border: Border.all(
                                    color: mainColor1,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.2),
                                      blurRadius: 5,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Yash",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      itemSize: 25,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      unratedColor: Colors.amber.withAlpha(50),
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print("rating" + rating.toString());
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    SizedBox(
                                      width: width / 1.5,
                                      child: Text(
                                        "Service is Very Good. I Appreciate the Service.",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
