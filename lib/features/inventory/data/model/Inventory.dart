import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Inventory {
  final String nama;
  final String nim;
  final String kelas;
  final String soal;
  final String matkul;
  final String imageUrl;
  final String updatedAt;
  final String nilai;

  Inventory({
    required this.nama,
    required this.nim,
    required this.kelas,
    required this.soal,
    required this.matkul,
    required this.imageUrl,
    required this.updatedAt,
    required this.nilai,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'kelas': kelas,
      'soal': soal,
      'matkul': matkul,
      'imageUrl': imageUrl,
      'updatedAt': updatedAt,
      'nilai': nilai,
    };
  }

  factory Inventory.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> map) {
    return Inventory(
      nama: map['nama'],
      nim: map['nim'],
      kelas: map['kelas'],
      soal: map['soal'],
      matkul: map['matkul'],
      imageUrl: map['imageUrl'],
      updatedAt: map['updatedAt'],
      nilai: map['nilai'],
    );
  }

  factory Inventory.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> map) {
    return Inventory(
      nama: map['nama'],
      nim: map['nim'],
      kelas: map['kelas'],
      soal: map['soal'],
      matkul: map['matkul'],
      imageUrl: map['imageUrl'],
      updatedAt: map['updatedAt'],
      nilai: map['nilai'],
    );
  }
}
