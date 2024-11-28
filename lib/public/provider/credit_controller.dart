import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notacredito/messages/get_all_notes.pb.dart';
import 'package:notacredito/messages/get_by_dates.pb.dart';
import 'package:notacredito/messages/get_by_id.pbserver.dart';
import 'package:notacredito/messages/total_recauded.pb.dart';

class CreditController extends GetxController {
  var getAllNotesOutput = GetAllNotesOutputMessage().obs;

  var getAllNotesOutputError = BaseError().obs;
   var getByIdOutput = GetByIdOutputMessage().obs;

  var getByIdOutputError = GetByIdError().obs;
  var totalRecaudedOutput = TotalRecaudedOutputMessage().obs;

  var totalRecaudedOutputError = BaseError().obs;
  final Rx<TextEditingController> initDateController =
      TextEditingController().obs;
  var initDateColor = Colors.black.obs;
  final Rx<TextEditingController> finalDateController =
      TextEditingController().obs;
  var finalDateColor = Colors.black.obs;
  final Rx<TextEditingController> idController = TextEditingController().obs;
  var idColor = Colors.black.obs;
  var tableVisibility = true.obs;
  void onInit() async {
    await getAllNotes(true);
    super.onInit();
  }

  Future<void> getAllNotes(bool fetchSliderData) async {
    print("Starting getAllNotes...");

    // Crear el mensaje de entrada y enviarlo
    final dart_input_message = GetAllNotesInputMessage();
    print("Sending signal to Rust...");
    dart_input_message.sendSignalToRust();

    // Esperar la respuesta de Rust
    print("Waiting for Rust response...");
    final registerDataOutput = await Future.any([
      GetAllNotesOutputMessage.rustSignalStream.first,
      BaseError.rustSignalStream.first
    ]);

    print("Received data from Rust: $registerDataOutput");

    // Asegurarnos de que la respuesta es válida antes de procesarla
    if (registerDataOutput == null) {
      print("Error: No response received from Rust.");
      return;
    }

    // Convertir el tipo de mensaje recibido
    final message = registerDataOutput.message;
    print("Received message type: ${message.runtimeType}");

    if (message is GetAllNotesOutputMessage) {
      // Manejo del mensaje de éxito
      print("Received successful GetAllNotesOutputMessage");
      getAllNotesOutput.value = message;
    } else if (message is BaseError) {
      // Manejo del mensaje de error
      print("Received error message from Rust: $message");
      getAllNotesOutputError.value = message;
    } else {
      print("Unexpected message type: ${message.runtimeType}");
    }

    print("getAllNotes completed.");
  }

  Future<void> totalRecauded(bool fetchSliderData) async {
    print("Starting getAllNotes...");

    // Crear el mensaje de entrada y enviarlo
    final dart_input_message = TotalRecaudedInputMessage();
    print("Sending signal to Rust...");
    dart_input_message.sendSignalToRust();

    // Esperar la respuesta de Rust
    print("Waiting for Rust response...");
    final registerDataOutput = await Future.any([
      TotalRecaudedOutputMessage.rustSignalStream.first,
      BaseError.rustSignalStream.first
    ]);

    print("Received data from Rust: $registerDataOutput");

    // Asegurarnos de que la respuesta es válida antes de procesarla
    if (registerDataOutput == null) {
      print("Error: No response received from Rust.");
      return;
    }

    // Convertir el tipo de mensaje recibido
    final message = registerDataOutput.message;
    print("Received message type: ${message.runtimeType}");

    if (message is TotalRecaudedOutputMessage) {
      // Manejo del mensaje de éxito

      totalRecaudedOutput.value = message;
    } else if (message is BaseError) {
      totalRecaudedOutputError.value = message;
    } else {}
  }

  Future<void> filter_by_dates() async {
    print("ingreso");
    // Crear el mensaje de entrada y enviarlo
    final dart_input_message = GetAllNotesByDateInputMessage(
        fechaInicio: initDateController.value.text,
        fechaFin: finalDateController.value.text);
    dart_input_message.sendSignalToRust();

    // Esperar la respuesta de Rust
    final registerDataOutput = await Future.any([
      GetAllNotesByDateOutputMessage.rustSignalStream.first,
      BaseError.rustSignalStream.first
    ]);

    // Asegurarnos de que la respuesta es válida antes de procesarla
    if (registerDataOutput == null) {
      return;
    }

    // Convertir el tipo de mensaje recibido
    final message = registerDataOutput.message;

    if (message is GetAllNotesByDateOutputMessage) {
      print(message);
      final idsToFilter =
          message.notes.map((note) => note.codigoNotaCredito).toList();

      // Manejo del mensaje de éxito
      final filteredNotes = getAllNotesOutput.value.notes.where((note) {
        return idsToFilter.contains(note.codigoNotaCredito);
      });
      getAllNotesOutput.value = GetAllNotesOutputMessage(notes: filteredNotes);
    } else if (message is BaseError) {
      // Manejo del mensaje de error
      getAllNotesOutputError.value = message;
    } else {}
  }

  Future<void> find_by_id(String id) async {
    final dart_input_message = GetByIdInputMessage(codigoNotaCredito: id);
    dart_input_message.sendSignalToRust();
    print("entro");
    // Esperar la respuesta de Rust
    final registerDataOutput = await Future.any([
      GetAllNotesOutput.rustSignalStream.first,
      BaseError.rustSignalStream.first
    ]);
    
    // Asegurarnos de que la respuesta es válida antes de procesarla
    if (registerDataOutput == null) {
      return;
    }

    // Convertir el tipo de mensaje recibido
    final message = registerDataOutput.message;
    print(message);
    if (message is GetAllNotesOutputMessage) {
      final note =
          message.notes.firstWhere((note) => note.codigoNotaCredito == id);
      getAllNotesOutput.value = GetAllNotesOutputMessage(notes: [note]);
    } else if (message is BaseError) {
      // Manejo del mensaje de error
      getAllNotesOutputError.value = message;
    } else {}
  }
}
