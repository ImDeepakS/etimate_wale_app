import 'package:Estimatewale/model/brand_model.dart';
import 'package:Estimatewale/view/app/forms/estimate_price.dart';
import 'package:Estimatewale/view/app/pages/blog_page.dart';
import 'package:Estimatewale/view/app/pages/profile_page.dart';
import 'package:Estimatewale/view/app/pages/store_page.dart';
import 'package:Estimatewale/view/app/users/dealer_register_page.dart';
import 'package:Estimatewale/view/app/users/user_register_page.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/service_tile_widget.dart';
import 'package:Estimatewale/view/widgets/slider_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List _screen = [
    HomeWidget(),
    StorePage(),
    DealerRegisterPage(),
    EstimatePricePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 0 || index == 1 || index == 4) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlogPage(),
        ),
      );
    } else if (index == 3) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EstimatePricePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _screen.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 90,
        width: width,
        padding: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: black.withOpacity(0.5),
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: black.withOpacity(0.5),
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              unselectedItemColor: dimGrey,
              selectedItemColor: mainColor,
              iconSize: 18,
              unselectedFontSize: 12,
              selectedFontSize: 12,
              showUnselectedLabels: true,
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.poppins(),
              unselectedLabelStyle: GoogleFonts.poppins(),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store_outlined),
                  activeIcon: Icon(Icons.store),
                  label: "Stores",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed_outlined),
                  activeIcon: Icon(Icons.feed),
                  label: "Blog",
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.contact_support_outlined),
                //   activeIcon: Icon(Icons.contact_support),
                //   label: "Contact",
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_quote_outlined),
                  activeIcon: Icon(Icons.request_quote),
                  label: "Estimate",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String location = 'Null, Press Button';
  String address = '';
  String city = 'Get Location';

  @override
  void initState() {
    super.initState();
    checkLocation();
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    city = '${place.subLocality}, ${place.locality}';
    address = '${place.street}, ${place.subLocality}, ${place.locality}';
    setState(() {
      storeLocationData(address);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CarouselSlider(
                      items: [
                        CarouselContainerWidget(
                          secondColor: yellowBody,
                          slider: "assets/slider1.png",
                          padd: EdgeInsets.only(top: 30),
                          text: "Repair Your Phone at Reasonable Prices",
                        ),
                        CarouselContainerWidget(
                          secondColor: purpleBody,
                          slider: "assets/slider2.png",
                          padd: EdgeInsets.only(top: 20),
                          text: "Hassle Free Service Over The World",
                        ),
                        CarouselContainerWidget(
                          secondColor: blueBody,
                          slider: "assets/slider3.png",
                          padd: EdgeInsets.only(top: 40, bottom: 10),
                          text: "Repair Your Phone On The Spot",
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        height: height,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.mapPin,
                                    size: 26,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Your City",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         SearchLocationFile(),
                                          //   ),
                                          // );
                                          Position position =
                                              await _getGeoLocationPosition();
                                          location =
                                              'Lat: ${position.latitude} , Long: ${position.longitude}';
                                          getAddressFromLatLong(position);
                                        },
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width / 1.7,
                                              child: Text(
                                                address,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 7),
                                            Icon(
                                              FontAwesomeIcons.chevronDown,
                                              size: 15,
                                              color: mainColor,
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
                        ],
                      ),
                      Row(
                        children: [
                          ServiceTile(
                            width: width / 1.02,
                            height: height,
                            header: "Click Here Estimate Price",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(color: mainColor1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "BRANDS WE REPAIR",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: dimGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 1.6,
                        width: width,
                        child: GridView.builder(
                          itemCount: brand.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.4),
                                      blurRadius: 1,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(brand[index].brandImage),
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
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    width: width,
                    height: height * 1.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/backImage.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: SizedBox(
                            width: width / 1.2,
                            child: Text(
                              "Estimatewale: High-Quality Mobile Repair",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: white,
                                shadows: [
                                  Shadow(
                                    color: black.withOpacity(0.8),
                                    blurRadius: 10,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 70),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: width / 1.3,
                            child: Text(
                              "Estimatewale is India's leading Platform For Mobile Repairs. Here User can take an estimate for various mobile Brands and Dealers. The Dealers provide their Best Price to attract Customers. Get the best",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: white,
                                shadows: [
                                  Shadow(
                                    color: black.withOpacity(0.8),
                                    blurRadius: 10,
                                    offset: Offset(0.5, 0.5),
                                  ),
                                ],
                              ),
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
    );
  }

  checkLocation() async {
    String? addres = await getAddress();

    print("address is $address");
    if (addres != null) {
      setState(() {
        address = addres;
      });
    } else {
      address = "Get Location";
    }
  }
}
