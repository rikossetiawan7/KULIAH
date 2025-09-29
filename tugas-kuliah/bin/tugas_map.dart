import 'dart:io';

void main() {
  Map<int, String> mahasiswa = {};
  int i = 0;

  while (i < 10) {
    stdout.write("Masukkan nama mahasiswa ke-${i + 1}: ");
    String? nama = stdin.readLineSync();

    if (nama != null && nama.isNotEmpty) {
      mahasiswa[i] = nama;
      i++;
    } else {
      print("Nama tidak boleh kosong!");
    }
  }

  print("\nData Mahasiswa:");
  mahasiswa.forEach((key, value) {
    print("Index $key: $value");
  });

  stdout.write("\nMasukkan nama yang ingin dicari: ");
  String? cari = stdin.readLineSync();

  bool ditemukan = false;
  mahasiswa.forEach((key, value) {
    if (value.toLowerCase() == cari?.toLowerCase()) {
      print("Nama '$value' ditemukan di index $key");
      ditemukan = true;
    }
  });

  if (!ditemukan) {
    print("Nama '$cari' tidak ditemukan dalam data.");
  }
}
