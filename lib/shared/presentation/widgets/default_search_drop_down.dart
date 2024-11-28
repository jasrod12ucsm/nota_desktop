import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DefaultSearchDropDown extends StatelessWidget {
  const DefaultSearchDropDown({
    super.key,
    required this.theme, required this.dropDownText, required this.controller, required this.resultText, required this.color, required this.filter, required this.label1, required this.label2,
  });


  final ThemeData theme;
  final List<String> dropDownText;
  final Rx<TextEditingController> controller;
  final Rx<String> resultText;
  final Rx<Color> color;
  final bool filter;
  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
      color: Colors.white,
      child: MouseRegion(
        onEnter: (event) {
          color.value = const Color
                                                                    .fromRGBO(248,
                                                                    90, 98, 1);
        },
        onExit: (event) {
          color.value = Colors.black;
        },
        child: DropdownSearch<
            String>(onChanged: (value) {
              resultText.value = value??'';
              controller.value.text = '';
              
            },
          selectedItem: null,
          items: dropDownText,
          dropdownDecoratorProps:
              DropDownDecoratorProps(
            dropdownSearchDecoration:
                InputDecoration(
              filled: true,
              fillColor: Color(
                  0xFFF5F5F5),
              labelText:
                  label1,
              labelStyle:
                  TextStyle(
                color: theme
                    .primaryColor,
                fontFamily:
                    "Segoe UI",
                fontSize: 14,
                fontWeight:
                    FontWeight
                        .w500,
                letterSpacing:
                    1.25,
              ),
              border:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            30),
              ),
              enabledBorder:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            30.0),
                borderSide: BorderSide(
                    color: color
                        .value,
                    width:
                        1), // Gris cuando no está enfocado
              ),
              focusedBorder:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            30.0),
                borderSide: BorderSide(
                    color: color
                        .value,
                    width:
                        1), // Gris cuando no está enfocado
              ),
              disabledBorder:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            30.0),
                borderSide: BorderSide(
                    color: color
                        .value,
                    width:
                        1), // Gris cuando no está enfocado
              ),
            ),
          ),
          popupProps:
              PopupProps.menu(
            fit: FlexFit.loose,
            constraints:
                BoxConstraints(),
            showSearchBox:
                true, // Activa la búsqueda en el popup
            searchFieldProps:
                TextFieldProps(
                    controller:
                        controller
                            .value,
                    decoration:
                        InputDecoration(
                      label: Text(
                          label2),
                      labelStyle:
                          TextStyle(
                        color: theme
                            .primaryColor,
                        fontFamily:
                            "Segoe UI",
                        fontSize:
                            14,
                        fontWeight:
                            FontWeight.w500,
                        letterSpacing:
                            1.25,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30)),
                      enabledBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color:
                                color.value,
                            width: 1), // Gris cuando no está enfocado
                      ),
                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color:
                                color.value,
                            width: 1), // Gris cuando no está enfocado
                      ),
                      disabledBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color:
                                color.value,
                            width: 1), // Gris cuando no está enfocado
                      ),
                    )),
            menuProps:
                MenuProps(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            15), // Bordes redondeados
                side:
                    BorderSide(
                  color: Colors
                      .black, // Color del borde
                  width: 1,
                ),
              ),
              elevation:
                  8, // Elevación para sombra
              shadowColor: Colors
                  .black, // Color de la sombra
            ),
            itemBuilder: (context,
                    item,
                    isSelected) =>
                Container(
              padding: EdgeInsets
                  .symmetric(
                      vertical:
                          10,
                      horizontal:
                          15),
              child: Text(
                item, // Muestra el texto del ítem
                style: TextStyle(
                    color: theme
                        .primaryColor),
              ),
            ),
          ), filterFn: filter
                  ? (item, filter) {
                      // Cuando filter es true, se hace la búsqueda según lo que el usuario ingresa
                      return item.toLowerCase().contains(filter.toLowerCase());
                    }
                  : (item, filter) {
                      // Cuando filter es false, no se aplica ningún filtro
                      return true;
                    },
        ),
      ),
    ));
  }
}
