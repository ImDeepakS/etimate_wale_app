import 'dart:convert';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/app/pages/blog_details_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List data = [];
  String imgData = "";
  String blogImg = '';

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future blogPosts() async {
    String apiurl = "https://estimatewale.com/application/restapi/blog.php";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> phoneData = json.decode(response.body);

      try {
        setState(() {
          data = phoneData["postData"];
        });
      } catch (e) {
        print("exception is $e");
      }

      print("blog data is $data");
    } else {
      jsonDecode("Not found any data");
      throw Exception("Failed to load brands data");
    }
  }

  @override
  void initState() {
    super.initState();
    blogPosts();
  }

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
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      imgData =
                          "https://estimatewale.com/blog/wp-content/uploads/2021/08/${data[index]["post_image"]}";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailPage(
                          image:
                              "https://estimatewale.com/blog/wp-content/uploads/2021/08/bg51-1024x576-1-825x510.jpg",
                          heading: data[index]["title"],
                          data: data[index]["body"],
                          date: data[index]["created_at"],
                          // views: blogModel[index].views,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 10,
                        ),
                        child: Container(
                          width: width - 40,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainColor,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://estimatewale.com/blog/wp-content/uploads/2021/08/bg51-1024x576-1-825x510.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 30,
                          right: 20,
                        ),
                        child: SizedBox(
                          width: width - 40,
                          child: Text(
                            data[index]["title"],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 30,
                          right: 20,
                        ),
                        child: Container(
                          width: width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: mainColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    data[index]["created_at"],
                                    style: GoogleFonts.poppins(
                                      color: shadyGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: mainColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 5),
                                  // Text(
                                  //   blogModel[index].views,
                                  //   style: GoogleFonts.poppins(
                                  //     color: shadyGrey,
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.w400,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              "Daily Posts",
              style: GoogleFonts.poppins(
                color: dimGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: white,
              ),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDetailPage(
                              image:
                                  "https://estimatewale.com/blog/wp-content/uploads/2021/08/bg51-1024x576-1-825x510.jpg",
                              heading: data[index]["title"],
                              data: data[index]["body"],
                              date: data[index]["created_at"],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Container(
                          width: width,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://estimatewale.com/blog/wp-content/uploads/2021/08/bg51-1024x576-1-825x510.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 5,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 1.55,
                                              height: 50,
                                              child: Text(
                                                data[index]["title"],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Container(
                                              width: width / 1.75,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.date_range,
                                                        color: mainColor,
                                                        size: 14,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        data[index]
                                                            ["created_at"],
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: shadyGrey,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.visibility,
                                                        color: mainColor,
                                                        size: 14,
                                                      ),
                                                      SizedBox(width: 5),
                                                      // Text(
                                                      //   blogModel[index].views,
                                                      //   style:
                                                      //       GoogleFonts.poppins(
                                                      //     color: shadyGrey,
                                                      //     fontSize: 12,
                                                      //     fontWeight:
                                                      //         FontWeight.w400,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
          ),
        ],
      ),
    );
  }
}
