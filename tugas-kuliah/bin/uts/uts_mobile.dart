import 'dart:math';

abstract class Transportasi{  //clas abstract adalah class induk
  String id, nama; 
  int kapasitas;
  double _tarifDasar;
  Transportasi(this.id, this.nama,this._tarifDasar, this.kapasitas);
  double get tarifDasar => _tarifDasar;
  double hitungTarif(int jmlPenumpang);
}

class Taksi extends Transportasi{
  double jarak;
  Taksi(super.id, super.nama, super.tarifDasar, super.kapasitas, this.jarak);
  double hitungTarif(int jml) => tarifDasar * jarak;  //menghitung jumlah tafif dan jarak
}

class Bus extends Transportasi{
  bool adaWifi;
  Bus(super.id, super.nama, super.tarifDasar, super.kapasitas, this.adaWifi);
  double hitungTarif(int jml) =>
    (tarifDasar * jml) + (adaWifi ? 5000 : 0); //tarifdasar 15.000+5000 =20.0000
}

class pesawat extends Transportasi{
  String kelas;
  pesawat(super.id, super.nama, super.tarifDasar, super.kapasitas, this.kelas);
  double hitungTarif(int jml) =>
    tarifDasar * jml * (kelas == 'Bisnis' ? 1.5 : 1.0); //penjumlahan tarif pesawat
}

class Pemesanan{
  String id, nama;
  Transportasi t;
  int jml;
  double total;
  Pemesanan(this.id, this.nama, this.t, this.jml, this.total);
  void cetak() =>
    print('$id | ${t.nama} | $nama | $jml org | Rp${total.toStringAsFixed(0)}');
}

String genId() => 'PM-${Random().nextInt(9999)}';    // untuk membuat id pesanan otomatis
Pemesanan buatPemesanan(Transportasi t, String n, int j) =>
  Pemesanan(genId(), n, t, j, t.hitungTarif(j));

  void tampilSemua(List<Pemesanan> d){     //membuat lis pemesanannya
    print('\n=== Riwayat Pemesanan ===');
    for (var p in d) p.cetak();
  }

  void main() {
    var taksi = Taksi('T1', 'Taksi Blue', 3000, 4, 10);
    var bus = Bus ('B1', 'Bus Kota', 15000, 40, true);
    var Pesawat = pesawat('P1', 'Garuda', 500000, 180, 'Bisnis');

    var daftar = [
      buatPemesanan(taksi, 'riko', 2),
      buatPemesanan(bus, 'bayu', 1),
      buatPemesanan(Pesawat, 'wiliam', 2),
    ];

    tampilSemua(daftar);
  }