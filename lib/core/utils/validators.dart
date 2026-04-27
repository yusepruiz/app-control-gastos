class AppValidators {
  // Validador de Email (Se usa en Login y Signup)
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa tu correo';
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) return 'Correo no válido';
    return null;
  }

  // Validador de Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa la contraseña';
    if (value.length < 3) return 'Mínimo 3 caracteres';
    return null;
  }

  // Validador de Nombre (Para el futuro Signup)
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'El nombre es obligatorio';
    return null;
  }
}
