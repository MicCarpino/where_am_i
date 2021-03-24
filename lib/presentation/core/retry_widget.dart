import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';

class RetryWidget extends StatelessWidget {
  final Function onTryAgainPressed;

  RetryWidget({@required this.onTryAgainPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(')=', style: TextStyle(fontSize: 50)),
            SizedBox(height: 16),
            Text('Si è verificato un errore', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            MaterialButton(
              onPressed: onTryAgainPressed,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Text('RIPROVA',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              color: dncLightBlue,
            )
          ],
      ),
    );
  }
}
