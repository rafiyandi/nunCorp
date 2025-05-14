String? wordValidation(String? value) {
  String pattern = r'^[a-zA-Z ]+$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Harus diisi';
  } else if (!regExp.hasMatch(value)) {
    return 'Hanya boleh terisi huruf saja';
  }
  return null;
}

String? emailValidation(String? value) {
  if (value!.isEmpty) {
    return 'Mohon Masukan Email';
  } else if (!value.contains('@')) {
    return 'Mohon Masukan Email Dengan Benar';
  } else {
    return null;
  }
}
