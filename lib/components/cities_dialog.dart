import 'package:flutter/material.dart';

import 'package:eglimpia/constants/colors.dart';
import 'package:eglimpia/data/cities.dart';

class CitiesDialog extends StatelessWidget {
  CitiesDialog({Key? key, this.selectedCode}) : super(key: key);

  final selectedCode;
  final List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 200,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cities.entries
                  .map<Widget>(
                    (item) => _cityItem(context, item, selectedCode),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cityItem(BuildContext context, MapEntry city, selectedCode) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, city.key);
      },
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  city.value,
                  style: TextStyle(
                    color: city.key == selectedCode
                        ? ColorsTheme.primary
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (city.key == selectedCode)
                  Icon(
                    Icons.done,
                    color: ColorsTheme.primary,
                  ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
