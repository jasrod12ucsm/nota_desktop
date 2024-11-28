import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget{
  final Widget innerWidget;
  const BackgroundScreen({super.key,required this.innerWidget});



  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 169, 1, 202), // Un morado vibrante
                Color.fromARGB(221, 231, 72, 85), // Un rosa fuerte
                Color.fromARGB(255, 221, 72, 49), // Un rojo cálido
              ],
              stops: [0.0, 0.5, 1.0], // Las paradas para los colores
              tileMode: TileMode.clamp, // Evita la repetición del degradado
            ),
          ),
          child: innerWidget);
  }
}