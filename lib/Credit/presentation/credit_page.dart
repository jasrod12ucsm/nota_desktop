import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notacredito/public/provider/credit_controller.dart';
import 'package:notacredito/shared/presentation/widgets/default_form_field_2.dart';

class Credit_page extends StatelessWidget {
  const Credit_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final creditController = Get.put(CreditController());
    
      // Si no hay notas disponibles, mostrar un mensaje de carga.
     
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
              child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          color: Colors.blue,
                          child: SingleChildScrollView(
                            child: Obx(
                              () => Container(
                                width: constraints.maxWidth,
                                height: 70 +
                                    70 *
                                        creditController.getAllNotesOutput.value
                                            .notes.length
                                            .toDouble(),
                                color: Colors.cyanAccent,
                                child: Table(
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(
                                      children: [
                                        Container(
                                          height: 70, // Altura de la fila
                                          child: Center(
                                              child: Text(
                                            'ID',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Nombre CLiente',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Ruc Cliente',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Motivo',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Factura Code',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Precio',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Fecha de emisión',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Dirección de Cliente',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Dirección de Empresa',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Forma de pago',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Rutas',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Observaciones',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Cancelación',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Guia Remisión Remitente',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                          height: 70,
                                          child: Center(
                                              child: Text(
                                            'Guia Remisión Transportista',
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                      ],
                                    ),
                                    ...List.generate(
                                        creditController.getAllNotesOutput.value
                                            .notes.length, (index) {
                                      final note = creditController
                                          .getAllNotesOutput.value.notes[index];
                                      return TableRow(
                                        children: [
                                          // Aquí accedemos directamente a las propiedades del `note`
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note.codigoNotaCredito,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note.clienteNombre,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.clienteRuc,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.motivo,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note.facturaCodigo,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.precio,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.fechaEmision,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note.clienteCalle +
                                                          note.clienteAvenida +
                                                          note.clienteCiudad +
                                                          note
                                                              .clienteDepartamento +
                                                          note.empresaDistrito,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note.empresaCalle +
                                                          note.empresaAvenida +
                                                          note.clienteCiudad +
                                                          note
                                                              .clienteDepartamento +
                                                          note.empresaDistrito,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.formaPago,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.rutas.join(),
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note.observaciones.join(),
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(note.tipo,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note
                                                          .guiaRemisionRemitente,
                                                      textAlign:
                                                          TextAlign.center))),
                                          Container(
                                              height: 70,
                                              child: Center(
                                                  child: Text(
                                                      note
                                                          .guiaRemisionTransportista,
                                                      textAlign:
                                                          TextAlign.center))),
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              )),
              Container(
                color: Colors.red,
                height: 70,
                width: constraints.maxWidth,
                child: Center(
                  child: SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {creditController.getAllNotes(true);},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12), // Espaciado
                          backgroundColor: Colors.pink),
                      child: const Center(
                        child: Text(
                          'GET NOTES',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Segoe UI",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 70,
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        height: 45,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {creditController.totalRecauded(true);},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12), // Espaciado
                              backgroundColor: Colors.pink),
                          child: const Center(
                            child: Text(
                              'RECAUDED',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Segoe UI",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Obx(
                        () => Container(
                          height: 45,
                          width: 500,
                          child: Center(
                            child: Text(
                              creditController.totalRecaudedOutput.value
                                      .totalRecaudedP +
                                  " " +
                                  creditController
                                      .totalRecaudedOutput.value.totalRecaudedT,
                              style: TextStyle(
                                color: Colors.pink,
                                fontFamily: "Segoe UI",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  )),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 85,
                      width: constraints.maxWidth,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                              height: 45,
                              width: 150,
                              child: Obx(
                                () => MouseRegion(
                                    onEnter: (event) {
                                      creditController.initDateColor.value =
                                          const Color.fromRGBO(248, 90, 98, 1);
                                    },
                                    onExit: (event) {
                                      creditController.initDateColor.value =
                                          Colors.black;
                                    },
                                    child: DefaultFormField2(
                                      enabledBorderColor:
                                          creditController.initDateColor.value,
                                      labelText: 'initDate',
                                      controller: creditController
                                          .initDateController.value,
                                      obscureText: false,
                                      suffixIcon: Icon(
                                        MdiIcons.calendar,
                                        color: Colors.pink,
                                      ),
                                      onTap: () async {
                                        final DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              DateTime.now(), // Fecha inicial
                                          firstDate:
                                              DateTime(1900), // Fecha mínima
                                          lastDate:
                                              DateTime.now(), // Fecha máxima
                                          locale: const Locale(
                                              'es'), // Idioma del calendario
                                        );

                                        if (pickedDate != null) {
                                          // Actualizar el controlador con la fecha seleccionada
                                          creditController.initDateController
                                                  .value.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(creditController
                                              .initDateController.value.text);
                                        }
                                      },
                                    ),
                                  ),
                                
                              )),
                          Expanded(child: Container()),
                          Container(height: 45, width: 200, child: ElevatedButton(
                          onPressed: () {creditController.filter_by_dates();},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12), // Espaciado
                              backgroundColor: Colors.pink),
                          child: const Center(
                            child: Text(
                              'FILTER',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Segoe UI",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.25,
                              ),
                            ),
                          ),
                        ),),
                          Expanded(child: Container()),
                          Container(
                            height: 45,
                            width: 150,child: Obx(
                                () => MouseRegion(
                                    onEnter: (event) {
                                      creditController.finalDateColor.value =
                                          const Color.fromRGBO(248, 90, 98, 1);
                                    },
                                    onExit: (event) {
                                      creditController.finalDateColor.value =
                                          Colors.black;
                                    },
                                    child: DefaultFormField2(
                                      enabledBorderColor:
                                          creditController.finalDateColor.value,
                                      labelText: 'finalDate',
                                      controller: creditController
                                          .finalDateController.value,
                                      obscureText: false,
                                      suffixIcon: Icon(
                                        MdiIcons.calendar,
                                        color: Colors.pink,
                                      ),
                                      onTap: () async {
                                        final DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              DateTime.now(), // Fecha inicial
                                          firstDate:
                                              DateTime(1900), // Fecha mínima
                                          lastDate:
                                              DateTime.now(), // Fecha máxima
                                          locale: const Locale(
                                              'es'), // Idioma del calendario
                                        );

                                        if (pickedDate != null) {
                                          // Actualizar el controlador con la fecha seleccionada
                                          creditController.finalDateController
                                                  .value.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(creditController
                                              .finalDateController.value.text);
                                        }
                                      },
                                    ),
                                  ),
                                
                              )
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ),
                   
                  ],
                ),
              ),
              Container(height: 85, width: constraints.maxWidth, child: Column(children: [Expanded(child: Container()),Container(height: 45, width: constraints.maxWidth, child: Row(children: [Expanded(child: Container()), Container(height: 45, width: 200, child: ElevatedButton(
                          onPressed: () {creditController.find_by_id(creditController.idController.value.text);},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12), // Espaciado
                              backgroundColor: Colors.pink),
                          child: const Center(
                            child: Text(
                              'FILTER ID',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Segoe UI",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.25,
                              ),
                            ),
                          ),
                        ),),Expanded(child: Container()),Container(height: 45, width: 200, child:  Obx(
                                                                  () =>
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        MouseRegion(
                                                                      onEnter:
                                                                          (event) {
                                                                        creditController.idColor.value = const Color
                                                                            .fromRGBO(
                                                                            248,
                                                                            90,
                                                                            98,
                                                                            1);
                                                                      },
                                                                      onExit:
                                                                          (event) {
                                                                        creditController
                                                                            .idColor
                                                                            .value = Colors.black;
                                                                      },
                                                                      child:
                                                                          DefaultFormField2(
                                                                        enabledBorderColor: creditController
                                                                            .idColor
                                                                            .value,
                                                                        labelText:
                                                                            'surname',
                                                                        controller: creditController
                                                                            .idController
                                                                            .value,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),) ,Expanded(child: Container())],),) ,Expanded(child: Container())],))
            ],
          ));
        },
      );

  }
}
