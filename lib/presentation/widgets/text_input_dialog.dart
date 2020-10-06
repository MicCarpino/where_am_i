import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:meta/meta.dart';

class TextInputDialog extends StatelessWidget {
  final String messageText;
  final Function(String inputText) onAddButtonPressed;

  TextInputDialog({
    @required this.messageText,
    @required this.onAddButtonPressed,
  });

  final TextEditingController _textEditingController =
      new TextEditingController();
  final _textFormFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.messageText,
                  style: TextStyle(fontSize: 16, color: Colors.black54)),
              Form(
                key: _textFormFieldKey,
                child: TextFormField(
                  controller: _textEditingController,
                    autofocus: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Inserire un nominativo valido';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Annulla",
                        style: TextStyle(color: dncBlue),
                      ),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                    ),
                    SizedBox(width: 16),
                    FlatButton(
                      onPressed: () {
                        if (_textFormFieldKey.currentState.validate()) {
                          print('ma quindi? ${ _textEditingController.text.trim()}');
                          this.onAddButtonPressed(
                              _textEditingController.text.trim());
                        }
                      },
                      child: Text("Aggiungi", style: TextStyle(color: dncBlue)),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
