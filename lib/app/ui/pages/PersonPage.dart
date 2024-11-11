import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:share_plus/share_plus.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  Future<void> _requestPermission() async {
    bool statuses;
    if (Platform.isAndroid) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.androidInfo;
      final sdkInt = deviceInfo.version.sdkInt;
      statuses = sdkInt < 29 ? await Permission.storage.request().isGranted : true;
    } else {
      statuses = await Permission.photosAddOnly.request().isGranted;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final int numFoto = ModalRoute.of(context)!.settings.arguments as int ?? 0;
    String numFoto = "";
    String childName = "";
    final String data =
        ModalRoute.of(context)!.settings.arguments as String ?? "";

    print("PersonPage = " +  data.split('/')[1]);

    if (data.isNotEmpty) {
      childName = data.split('/')[0];
      numFoto = data.split('/')[1];
    }
    double screenHeight = MediaQuery.of(context).size.height;
    double sizeImage = (6 * screenHeight / 8) / 3333;

    return Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/fullImage', arguments: 'assets/images/portrait/foto_' + numFoto + '.jpg');
            },
            onLongPressStart: (value) {
              final RenderBox overlay = Overlay.of(context).context.findRenderObject()! as RenderBox;
                showMenu(
                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        child:
                        Text("Поделиться фото"),
                        onTap: () async {
                          //String asset = "assets/slideshow/${presentLocation.pictureList[0]}";
                          String asset = 'assets/images/portrait/foto_' + numFoto + '.jpg';
                          ByteData imagebyte = await rootBundle.load(asset);
                          Share.shareXFiles([
                            XFile.fromData(
                                imagebyte.buffer.asUint8List(),
                                mimeType: 'image/webp',
                                name: 'foto_' + numFoto + '.jpg')
                          ],
                              text: 'Shared from MyFoTo');
                        }
                      ),
                      /*
                      PopupMenuItem(
                         child:
                            Text("Напечатать фото"),
                        onTap: () async {
                          final image = await imageFromAssetBundle('assets/images/portrait/foto_' + numFoto + '.jpg');
                          final doc = pw.Document();
                          doc.addPage(pw.Page(
                              build: (pw.Context context) {
                                return pw.Center(
                                  child: pw.Image(image),
                                ); // Center
                              }));
                          await Printing.layoutPdf(
                              onLayout: (PdfPageFormat format) async => doc.save());
                        },
                      ),
                       */
                      PopupMenuItem(
                        child:
                        Text("Сохранить фото"),
                        onTap: () async {
                            final byteData = await rootBundle.load(
                                'assets/images/portrait/foto_' + numFoto +
                                    '.jpg');

                            final result = await SaverGallery.saveImage(
                              byteData.buffer.asUint8List(),
                              fileName: 'assets/images/portrait/foto_' + numFoto + '.jpg',
                              skipIfExists: true,
                            );
                            if(result == true)
                              ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                              content: new Text("Фото успешно сохранено"),
                              ));
                            else
                              ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                content: new Text("Сохранение не удалось"),
                              ));
                          }
                      )
                    ],
                    context: context,
                  position: RelativeRect.fromLTRB(
                    value.localPosition.dx,
                    value.localPosition.dy,
                    overlay.size.width - value.localPosition.dx,
                    overlay.size.height - value.localPosition.dy,
                  ),
                );},
            child: Container(
              color: Colors.white,
              height: 6 * screenHeight / 8,
              child: ClipRect(
                child: PhotoView(
                  imageProvider: AssetImage('assets/images/portrait/foto_' + numFoto + '.jpg'),
                  minScale: sizeImage,
                  maxScale: 1.2,
                  initialScale: PhotoViewComputedScale.covered,
                ),
              ),
            ),
          ),
          Text(childName,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center),
          Text(
              "У каждого человека есть свои отличительные черты. Вот и моя подруга не исключение. "
              "У нее очень длинные и красивые светлые волосы. Улыбка у нее очень задорная, а смех заразительный",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/video');
            },
            child: const Text('Интервью'),
          )
        ]));
  }
}
