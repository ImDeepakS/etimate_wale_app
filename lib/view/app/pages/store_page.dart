import 'package:fix_team_app/model/store_model.dart';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/app/pages/store_detail_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: dimGrey,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return CircularProgressIndicator(
                            color: mainColor,
                          );
                        default:
                          if (snapshot.hasError) {
                            return Text("error ${snapshot.error}");
                          } else {
                            return SingleChildScrollView(
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: storeData.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StoreDetailsPage(
                                                  storeAddress: storeData[index]
                                                      .storeAddress,
                                                  storeImage: storeData[index]
                                                      .storeImage,
                                                  storeName: storeData[index]
                                                      .storeName,
                                                  storeContact:
                                                      storeData[index].contact,
                                                  storeEmail:
                                                      storeData[index].email,
                                                  storeExp:
                                                      storeData[index].shopExp,
                                                  storeUser:
                                                      storeData[index].username,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  padding: EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    color: mainColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 1,
                                                        color: black
                                                            .withOpacity(0.4),
                                                        offset: Offset(-0.5, 0),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          storeData[index]
                                                              .storeImage,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: width - 120,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    color: mainColor1,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 1,
                                                        color: black
                                                            .withOpacity(0.4),
                                                        offset:
                                                            Offset(0.5, 0.5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          storeData[index]
                                                              .storeName,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: dimGrey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          storeData[index]
                                                              .storeAddress,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: dimGrey,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 80),
                                ],
                              ),
                            );
                          }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
