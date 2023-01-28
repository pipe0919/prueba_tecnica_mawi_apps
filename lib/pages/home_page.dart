// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final spaceHeigth = SizedBox(
    height: 25,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0), child: appBar()),
      body: body(context),
    );
  }

  Widget appBar() {
    return AppBar(
      title: const Text(
        'Mi medicación',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      actions: [
        SizedBox(
            width: 40,
            child: Row(
              children: [
                SvgPicture.asset('assets/1.svg', width: 30),
              ],
            ))
      ],
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            spaceHeigth,
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Informaciones generales',
                textAlign: TextAlign.left,
                style: TextStyle(color: ColorsApp.colorTitulos, fontSize: 16),
              ),
            ),
            spaceHeigth,
            textoGenerico('Nombre Comercial', 'Medicacion Comercial', context),
            lineaDivisoria(context),
            textoGenerico('Droga genérica', 'Drogra Generica', context),
            lineaDivisoria(context),
            textoGenerico('Concentracion', '--', context),
            lineaDivisoria(context),
            textoGenerico('Tipo de Medicacion', '--', context),
            spaceHeigth,
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Informacion espeficica',
                textAlign: TextAlign.left,
                style: TextStyle(color: ColorsApp.colorTitulos, fontSize: 16),
              ),
            ),
            spaceHeigth,
            textoGenerico('Dosis', '1Mg', context),
            lineaDivisoria(context),
            textoGenerico('Frecuencia de la toma',
                'Cada 2 semanas, los jueves y los domingos', context),
            lineaDivisoria(context),
            textoGenericoConIcono('Hora de la alerta', '8:00', context),
            textoGenericoConIcono('', '10:30', context),
            textoGenericoConIcono('', '17:00', context),
            spaceHeigth,
            SizedBox(
              height: size.width * 0.15,
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(width: 2, color: ColorsApp.colorTitulos),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add,
                      color: ColorsApp.colorTitulos,
                    ),
                    Text(
                      'Añadir hora',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: ColorsApp.colorTitulos, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            lineaDivisoria(context),
            textoGenerico('Duración', 'Hasta el 15/11/22', context),
            lineaDivisoria(context),
            textConAlertaIcono("Aleta de stock (menos de 50)", context),
            textConAlertasinIcono("Notificaciones", context),
            textConAlertasinIcono("Estado: activa", context),
            spaceHeigth,
            spaceHeigth,
            SizedBox(
              height: size.width * 0.15,
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsApp.colorTitulos.withOpacity(0.5)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: Text(
                  'Guardar',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            spaceHeigth,
          ],
        ),
      ),
    );
  }

  Widget textoGenerico(String textIzq, String textDer, context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: size.width * 0.4,
            height: size.height * 0.05,
            child: Text(
              textIzq,
              maxLines: 2,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: size.width * 0.4,
            height: size.height * 0.05,
            child: Text(
              textDer,
              maxLines: 2,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorsApp.colorTitulos, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget textConAlertaIcono(String textoInicial, context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            alignment: Alignment.centerLeft,
            height: size.height * 0.05,
            child: Icon(Icons.check_circle_rounded, color: Colors.green),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: size.height * 0.05,
            child: Text(
              textoInicial,
              maxLines: 2,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorsApp.colorTitulos, fontSize: 14),
            ),
          ),
        ]),
        Container(
          alignment: Alignment.centerRight,
          height: size.height * 0.05,
          child: SvgPicture.asset('assets/1.svg', width: 30),
        ),
      ],
    );
  }

  Widget textConAlertasinIcono(String textoInicial, context) {
    final size = MediaQuery.of(context).size;
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        alignment: Alignment.centerLeft,
        height: size.height * 0.05,
        child: Icon(Icons.check_circle_rounded, color: Colors.green),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: size.height * 0.05,
        child: Text(
          textoInicial,
          maxLines: 2,
          textAlign: TextAlign.right,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: ColorsApp.colorTitulos, fontSize: 14),
        ),
      ),
    ]);
  }

  Widget textoGenericoConIcono(String textIzq, String textDer, context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: size.width * 0.4,
            height: size.height * 0.05,
            child: Text(
              textIzq,
              maxLines: 2,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: size.width * 0.4,
            height: size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textDer,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: ColorsApp.colorTitulos, fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                SvgPicture.asset('assets/3.svg', width: 14)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget lineaDivisoria(context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        spaceHeigth,
        Container(
          height: size.height * 0.001,
          color: Colors.grey,
        ),
        spaceHeigth,
      ],
    );
  }
}
