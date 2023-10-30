import 'package:flutter/material.dart';
import 'package:tutorialapp/model/country/Country.dart';
import 'package:tutorialapp/network/api/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:tutorialapp/repository/country_repository.dart';
import 'package:tutorialapp/views/components/circle_image.dart';
import 'package:tutorialapp/screens/country_details.dart';
import 'package:get/get.dart';

import '../utils/dimens.dart';

class CountryListPage extends StatelessWidget {
  const CountryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CountryRepository countryRepo = Get.find();
    Future<List<Country>> getCountryList = countryRepo.getAllCountries();
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: FutureBuilder(
          future: getCountryList,
          builder: (context, dataSnapshot) {
            if (dataSnapshot.hasData) {
              List<Country>? countryList = dataSnapshot.data;
              return ListView.builder(
                  itemCount: countryList?.length,
                  itemBuilder: (context, position) {
                    if (countryList != null) return countryListItemWidget(countryList[position]);
                    return null;
                  });
            } else if (dataSnapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      'Error occurred: ${dataSnapshot.error}',
                      style: TextStyle(fontSize: Dimens.fontLarge),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getCountryList = countryRepo.getAllCountries();
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget countryListItemWidget(Country country) {
    return Card(
      child: ListTile(
        leading: SizedBox(
            width: 100,
            height: 50,
            child: CircleImageWidget(isAsset: false, imagePath: '${country.flags?.svg}')),
        title: Text(country.name ?? ''),
        subtitle: Text(country.region ?? ''),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetails(country)));
          Get.to(() => CountryDetails(country));
        },
      ),
    );
  }
}
