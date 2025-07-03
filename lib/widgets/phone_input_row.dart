import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

final List<CountryCode> countriesList =
    codes.map((c) => CountryCode.fromJson(c)).toList();

class PhoneInputRow extends StatelessWidget {
  final CountryCode selectedCountry;
  final ValueChanged<CountryCode> onCountryChanged;
  final String phone;
  final ValueChanged<String> onPhoneChanged;

  const PhoneInputRow({
    super.key,
    required this.selectedCountry,
    required this.onCountryChanged,
    required this.phone,
    required this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = Theme.of(context).inputDecorationTheme.fillColor;
    final borderColor = Theme.of(context).dividerColor;

    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          //bayrak kısmı
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCountry.dialCode,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (String? dial) {
                if (dial != null) {
                  onCountryChanged(CountryCode.fromDialCode(dial));
                }
              },
              items: countriesList.map((c) {
                return DropdownMenuItem<String>(
                  value: c.dialCode,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(
                          'packages/country_code_picker/${c.flagUri}',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 6),
                      Text(c.dialCode ?? ''),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 12),

          // numara girme yeri
          Expanded(
            child: TextFormField(
              initialValue: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Telefon Numarası',
              ),
              onChanged: onPhoneChanged,
            ),
          ),
        ],
      ),
    );
  }
}