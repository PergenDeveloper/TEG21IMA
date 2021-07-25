import 'package:eglimpia/constants/colors.dart';
import 'package:flutter/material.dart';

class ActionsDialog extends StatelessWidget {
  const ActionsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context, 1);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: ColorsTheme.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Crear una campaña',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: ColorsTheme.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Crear una incidencia',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
