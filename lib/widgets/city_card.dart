import 'package:find_house_app/models/city.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Icon(Icons.star_rounded, color: Colors.amber),
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),
            const SizedBox(height: 11),
            Text(city.name, style: blackTextStyle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
