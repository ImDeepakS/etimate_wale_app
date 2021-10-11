// ignore_for_file: unnecessary_null_comparison

import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailScreen extends StatefulWidget {
  final String storeImage,
      storeName,
      storeAddress,
      storeUser,
      storeContact,
      storeEmail,
      storeExp,
      videourl;
  const VideoDetailScreen({
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
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  String url = '';

  late YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
    if (widget.videourl == null) {
      url = "https://youtu.be/ePbL7jLAV1c";
    } else if (widget.videourl != null) {
      url = widget.videourl;
    }
    runYoutubePlayer();
  }

  void runYoutubePlayer() {
    _playerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: true,
      ),
    );
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Color(0xFF282828),
          body: SafeArea(
            child: Column(
              children: [
                player,
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.storeName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: white,
                                      size: 40,
                                    ),
                                  ),
                                ],
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
                                "Store Image",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: height / 4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widget.storeImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
