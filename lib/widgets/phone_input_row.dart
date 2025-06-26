import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';

class PhoneInputRow extends StatelessWidget {
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
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
            child: DropdownButton<Country>(
              value: selectedCountry,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (Country? c) {
                if (c != null) onCountryChanged(c);
              },
              items: countries.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(
                          'packages/intl_phone_field/assets/flags/${c.code.toLowerCase()}.png',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 6),
                      Text(c.dialCode),
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