import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'models/login_phone_model.dart';
import 'widgets/phone_input_row.dart';
import 'theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Input App',
      theme: appTheme,
      home: const PhoneInputPage(),
    );
  }
}

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({super.key});
  @override
  State<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  final LoginPhoneModel model = LoginPhoneModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Telefon Girişi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PhoneInputRow(
          selectedCountry: countries.firstWhere(
            (c) => c.code == model.countryCode,
            orElse: () => countries.firstWhere((c) => c.code == 'TR'),
          ),
          onCountryChanged: (country) {
            setState(() => model.countryCode = country.code);
          },
          phone: model.phoneNumber,
          onPhoneChanged: (value) {
            setState(() => model.phoneNumber = value);
          },
        ),
      ),
    );
  }
}
