import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCurrency = "USD";
  Country? _selectedCountry;

  Widget dropDownitem(Country country) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Exchange",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: CountryPickerDropdown(
          initialValue: 'US',
          onValuePicked: (Country? country) {
            setState(() {
              _selectedCountry = country;
            });
          },
        ),
      ),
      bottomNavigationBar: _selectedCountry != null
          ? Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selected Country: ${_selectedCountry!.name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                
                ],
              ),
            )
          : null,
    );
  }
}
