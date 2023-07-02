import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Inventory {
  final String nama;
  final String nim;
  final String kelas;
  final String no;
  final String matkul;
  final String imageUrl;
  final String updatedAt;

  Inventory({
    required this.nama,
    required this.nim,
    required this.kelas,
    required this.no,
    required this.matkul,
    required this.imageUrl,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'kelas': kelas,
      'no': no,
      'matkul': matkul,
      'imageUrl': imageUrl,
      'updatedAt': updatedAt,
    };
  }

  factory Inventory.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> map) {
    return Inventory(
        nama: map['nama'],
        nim: map['nim'],
        kelas: map['kelas'],
        no: map['no'],
        matkul: map['matkul'],
        imageUrl: map['imageUrl'],
        updatedAt: map['updatedAt']);
  }

  factory Inventory.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> map) {
    return Inventory(
        nama: map['nama'],
        nim: map['nim'],
        kelas: map['kelas'],
        no: map['no'],
        matkul: map['matkul'],
        imageUrl: map['imageUrl'],
        updatedAt: map['updatedAt']);
  }
}
