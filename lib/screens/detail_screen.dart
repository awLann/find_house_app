import 'package:find_house_app/models/space.dart';
import 'package:find_house_app/screens/error_screen.dart';
import 'package:find_house_app/theme.dart';
import 'package:find_house_app/widgets/facility_item.dart';
import 'package:find_house_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.space});

  final Space space;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchExternalUrl(String urlString) async {
      final Uri url = Uri.parse(urlString);
      final bool result = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!result) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ErrorScreen()),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children:
                                  [1, 2, 3, 4, 5].map((index) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: RatingItem(
                                        index: index,
                                        rating: widget.space.rating,
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Big Lemari',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              widget.space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(left: 24),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
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
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () {
                                launchExternalUrl(widget.space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        child: ElevatedButton(
                          onPressed: () {
                            launchExternalUrl('tel:${widget.space.phone}');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/btn_back.png', width: 40),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child:
                        isClicked
                            ? Image.asset('assets/btn_wishlist_active.png', width: 40)
                            : Image.asset('assets/btn_wishlist.png', width: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
