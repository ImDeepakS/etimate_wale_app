import 'package:fix_team_app/model/queries_model.dart';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:flutter/material.dart';

class QueriesListPage extends StatefulWidget {
  const QueriesListPage({Key? key}) : super(key: key);

  @override
  _QueriesListPageState createState() => _QueriesListPageState();
}

class _QueriesListPageState extends State<QueriesListPage> {
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
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Icon(Icons.arrow_back_ios)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Queries",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sr.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xfff7e841),
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Shop",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xfff7e841),
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Brand",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xfff7e841),
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Model",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xfff7e841),
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Problem",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xfff7e841),
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height / 1.33,
                width: width,
                child: ListView.builder(
                  itemCount: queriesDummy.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              queriesDummy[index].index,
                            ),
                            Text(
                              queriesDummy[index].shopName,
                            ),
                            Text(
                              queriesDummy[index].brand,
                            ),
                            Text(
                              queriesDummy[index].model,
                            ),
                            Text(
                              queriesDummy[index].problem,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
