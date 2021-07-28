import 'package:fix_team_app/model/dealer_model.dart';
import 'package:fix_team_app/view/app/pages/dealer_profile.dart';
import 'package:flutter/material.dart';

class DealersListPage extends StatefulWidget {
  const DealersListPage({Key? key}) : super(key: key);

  @override
  _DealersListPageState createState() => _DealersListPageState();
}

class _DealersListPageState extends State<DealersListPage> {
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
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => DealerProfilePage(
                        shopImage: dummyData[index].shopImage,
                        address: dummyData[index].address,
                        contactNumber: dummyData[index].contactNumber,
                        dealerName: dummyData[index].dealerName,
                        distance: dummyData[index].distance,
                        price: dummyData[index].price,
                        shopName: dummyData[index].shopName,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    height: height / 6,
                    width: width,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height / 6,
                              width: width / 3.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    dummyData[index].shopImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dummyData[index].shopName.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        dummyData[index].dealerName.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        dummyData[index]
                                            .contactNumber
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        dummyData[index].address.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  height: height / 24,
                                  width: width / 1.6,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Distance: " +
                                              dummyData[index]
                                                  .distance
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 80),
                                          child: Text(
                                            "\$" +
                                                dummyData[index]
                                                    .price
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xfff7e841),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
