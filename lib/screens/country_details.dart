import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/country/Country.dart';
import '../utils/app_images.dart';
import '../utils/dimens.dart';

class CountryDetails extends StatelessWidget {
  final Country country;

  const CountryDetails(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.padding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${country.name}',
              style: const TextStyle(
                  fontSize: Dimens.fontHeader1,
                  backgroundColor: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimens.space10),
            Text('Region : ${country.region}'),
            const SizedBox(height: Dimens.space10),
            Text('Country Name Code : ${country.alpha3Code}'),
            const SizedBox(height: Dimens.space10),
            Text('Capital : ${country.capital}'),
            const SizedBox(height: Dimens.space10),
            Text('Population : ${country.population}'),
            const SizedBox(height: Dimens.space10),
            Text('Calling Code : ${country.callingCodes?.join(',')}'),
            const SizedBox(height: Dimens.space50),
            Center(
              child: SvgPicture.network(
                '${country.flags?.svg}',
                fit: BoxFit.cover,
                width: 300,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
