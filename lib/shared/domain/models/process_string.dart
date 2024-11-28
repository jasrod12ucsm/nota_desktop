String? processString(String value) {
  return value.isEmpty ? null : value;
}
double? processStringToDouble(String? value) {
  return value?.isEmpty ?? true ? null : double.tryParse(value!);
}
Iterable<String>? processCommaSeparatedString(String? value) {
  if (value?.isEmpty ?? true) {
    return null; // Si el valor es nulo o vacío, retorna null
  }
  return value!.split(','); // Divide el valor por comas y retorna un Iterable<String>
}