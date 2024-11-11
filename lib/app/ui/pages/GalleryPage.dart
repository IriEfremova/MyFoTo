import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int count = 29;
    //Сделать через json, когда будут все данные
    var childList = [
      "Стругова Татьяна Геннадьевна",
      "Береснева Настя",
      "Бесенева Маша",
      "Бледных Максим",
      "Бородина Виолетта",
      "Дианов Дима",
      "Ефременко Влад",
      "Ефремова Даша",
      "Зарипов Рома",
      "Каштанова Маруся",
      "Клевцова Вика",
      "Круглова Юния",
      "Косарева Вероника",
      "Курамшина Кира",
      "Кутышев Кирилл",
      "Лузин Ярослав",
      "Максименко Лида",
      "Никифоров Саша",
      "Пересторонина Алена",
      "Погорелко Полина",
      "Поддубная Настя",
      "Пожникова Ника",
      "Родионова Вика",
      "Рожковская Катя",
      "Соловьев Коля",
      "Соловьева Лада",
      "Сизов Паша",
      "Чебыкин Рома",
      "Фролов Рома"
    ];

    final double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        child: Stack(
            children: <Widget>[
          GridView.builder(
            itemCount: count,
            padding: const EdgeInsets.all(2.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 5 / 7),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/person', arguments: childList[index] + "/" + (index + 1).toString());
                  },
                  child: GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.white70,
                        title: Text(childList[index],
                            style: index == 0
                                ? Theme.of(context).textTheme.labelSmall
                                : Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center),
                      ),
                      child: Image.asset("assets/images/icons/portrait/foto_" +
                          (index + 1).toString() +
                          ".jpg")));
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: EdgeInsets.only(bottom:20, right:10),
              child: FloatingActionButton.extended(
              backgroundColor: Colors.white70,
              onPressed: (){
                Navigator.pushNamed(context, '/allphoto');
              },
              label: const Text("Общие фото")
            )),
          ),
        ]));
  }
}

