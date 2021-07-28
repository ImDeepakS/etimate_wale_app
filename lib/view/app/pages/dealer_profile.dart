import 'package:fix_team_app/view/app/forms/list_query.dart';
import 'package:flutter/material.dart';

class DealerProfilePage extends StatefulWidget {
  final String dealerName;
  final String price;
  final String address;
  final String shopName;
  final String contactNumber;
  final String shopImage;
  final String distance;
  const DealerProfilePage({
    Key? key,
    required this.dealerName,
    required this.price,
    required this.address,
    required this.shopName,
    required this.contactNumber,
    required this.shopImage,
    required this.distance,
  }) : super(key: key);

  @override
  _DealerProfilePageState createState() => _DealerProfilePageState();
}

class _DealerProfilePageState extends State<DealerProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image(
            image: AssetImage("assets/logo.png"),
            height: 20,
          ),
        ),
      ),
      body: Container(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: width,
                  height: height / 4,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.shopImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.shopName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.dealerName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade400,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.contactNumber,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade400,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.address,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade400,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Your Query",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 2.7,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Center(
                              child: Text(
                                "Problems list",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 3.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Center(
                              child: Text(
                                "Distance",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 3.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Center(
                              child: Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 2.7,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Center(
                              child: Text(
                                "Mobile Problem",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 3.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Center(
                              child: Text(
                                widget.distance,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 3.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Center(
                              child: Text(
                                "\$" + widget.price,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfff7e841),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QueriesListPage(),
                    ),
                  );
                },
                child: Container(
                  height: height / 16,
                  width: width / 2,
                  decoration: BoxDecoration(
                    color: Color(0xfff7e841),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Accept",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
