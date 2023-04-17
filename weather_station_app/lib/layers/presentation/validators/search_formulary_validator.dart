class SearchFormularyValidator {
  static String? verify(String? cityName) {
    if (cityName == null || cityName.isEmpty) {
      return 'Preencha o nome da Cidade.';
    }
    if (cityName.trim().length < 2) {
      return 'O nome da Cidade deve ter mais de 2 caracteres.';
    }
    return null;
  }
}
