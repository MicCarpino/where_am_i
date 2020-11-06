import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/size_config.dart';

class UpdateScreen extends StatelessWidget {
  final String currentVersion;
  final String newVersion;
  final String downloadUrl;

  UpdateScreen(this.currentVersion, this.newVersion, this.downloadUrl);

  static const platform = const MethodChannel('kotlinchannel');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'E\' disponibile una nuova versione di WhereAmI !',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Text('Versione installata: $currentVersion'),
              Text('Versione disponibile: $newVersion'),
              FlatButton(
                  height: 40,
                  color: dncBlue,
                  onPressed: () async {
                    var url =
                        "https://nas.dncsrl.com/share.cgi?ssid=0pd43wg&fid=0pd43wg&filename=WhereAmI.apk&openfolder=forcedownload&ep=";
                    if (await canLaunch(url)) {
                      launch(url);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: new Text(
                              'Non è stato possibile eseguire il download'),
                          duration: new Duration(seconds: 3)));
                    }
                  },
                  child: Text("Download",
                      style: new TextStyle(color: Colors.white))),
            ],
          ),
        ));
  }
}
