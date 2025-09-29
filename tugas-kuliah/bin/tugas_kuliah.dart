import 'dart:io';

void main() {
  // Meminta input skor dari pengguna
  stdout.write("Masukkan skor (0 - 100): ");
  String? input = stdin.readLineSync();

  if (input != null) {
    // Coba konversi input ke integer
    int? skor = int.tryParse(input);

    // Validasi input apakah angka dan dalam rentang 0 - 100
    if (skor == null || skor < 0 || skor > 100) {
      print("Error: Input tidak valid. Skor harus berupa angka 0 - 100.");
    } else {
      String grade;

      // Menentukan grade menggunakan if-else
      if (skor >= 85) {
        grade = "A";
      } else if (skor >= 70) {
        grade = "B";
      } else if (skor >= 60) {
        grade = "C";
      } else if (skor >= 50) {
        grade = "D";
      } else {
        grade = "E";
      }

      // Output hasil
      print("Skor Anda: $skor");
      print("Grade Anda: $grade");
    }
  } else {
    print("Error: Tidak ada input.");
  }
}
