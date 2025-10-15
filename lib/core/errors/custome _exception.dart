class CustomeException implements Exception {
  String massage;

  CustomeException({required this.massage});


  @override
  String toString() {
  return massage;

  }



}