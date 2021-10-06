import 'package:fix_team_app/view/app/pages/store_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StoreDetailsPage extends StatefulWidget {
  final String storeImage,
      storeName,
      storeAddress,
      storeUser,
      storeContact,
      storeEmail,
      storeExp,
      videourl;
  const StoreDetailsPage({
    Key? key,
    required this.storeImage,
    required this.storeName,
    required this.storeContact,
    required this.storeEmail,
    required this.storeExp,
    required this.storeUser,
    required this.storeAddress,
    required this.videourl,
  }) : super(key: key);

  @override
  State<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  late YoutubePlayerController _playerController;

  void runYoutubePlayer() {
    _playerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=ZQD76Le1AAg&list=PLSJdhltIC7IM04rUKOgnUSE8WT_CvqG-T&index=1")!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    runYoutubePlayer();
  }

  @override
  void deactivate() {
    _playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController,
      ),
      builder: (context, player) {
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
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: white,
              ),
              child: Column(
                children: [
                  Container(
                    height: height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.storeImage),
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
                      widget.storeName,
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
                              widget.storeUser,
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
                            SizedBox(
                              width: width / 1.38,
                              child: Text(
                                widget.storeAddress,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            LabelText(label: "Contact : "),
                            Text(
                              widget.storeContact,
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
                              widget.storeEmail,
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
                              widget.storeExp,
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
                          "Video",
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
                            children: [],
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
      },
    );
  }
}
