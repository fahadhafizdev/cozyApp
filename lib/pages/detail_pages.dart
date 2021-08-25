import 'package:flutter/material.dart';
import 'package:pencarian_kos/models/space.dart';
import 'package:pencarian_kos/theme.dart';
import 'package:pencarian_kos/widgets/facility_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pencarian_kos/pages/error_page.dart';
import 'package:pencarian_kos/widgets/rating_item.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    //TODO: FUNCTON URL
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Konfirmasi',
            style: blackTextStyle.copyWith(fontSize: 20),
          ),
          content: Text('Apakah anda ingin menghubungi pemilik kos ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Batal',
                style: purpleTextStyle,
              ),
            ),
            TextButton(
              // launchUrl(
              //     'https://api.whatsapp.com/send?phone=6281330648183&text=saya%20ingin%20pesan%20ruangan.');
              onPressed: () => launchUrl(
                  'https://api.whatsapp.com/send?phone=6281330648183&text=saya%20ingin%20pesan%20ruangan%20 ${space.name}.'),
              child: Text(
                'Hubungi',
                style: purpleTextStyle.copyWith(fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        20,
                      ),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price} ',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '/ month',
                                        style: lightTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((item) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: item,
                                    rating: space.rating,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Main Facilities',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/images/icon_kitchen.png',
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/images/icon_bedroom.png',
                              total: space.numberOfBadrooms,
                            ),
                            FacilityItem(
                              name: 'big lemari',
                              imageUrl: 'assets/images/icon_lemari.png',
                              total: space.numberOfCupBoards,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: PHOTOS
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: edge),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE:LOCATION
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Location',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.address,
                                  style: lightTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  space.city,
                                  style: lightTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/images/btn_maps.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () {
                            _showMyDialog();
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: edge,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  FavoritWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritWidget extends StatefulWidget {
  @override
  _FavoritWidgetState createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleFavorite,
      child: Image.asset(
        _isFavorited
            ? 'assets/images/btn_wishlist_red.png'
            : 'assets/images/btn_wishlist.png',
        width: 40,
        height: 40,
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      // if (_isFavorited) {
      //   _isFavorited = false;
      // } else {
      //   _isFavorited = true;
      // }
      _isFavorited = !_isFavorited;
    });
  }
}
