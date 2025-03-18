import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myaplication/domain/repository/favourites/favourites_repository_interface.dart';

class FavouritesService extends FavouritesServiceInterface {
  FavouritesService({required this.dio});
  final Dio dio;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');

  @override
  Future<void> addFavorite(
      {required int id,
      required String name,
      required String release,
      required String imdbRating,
      required String timing,
      required String description}) async {
    try {
      await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .doc(name)
          .set({
        'id': id,
        'name': name,
        'release': release,
        'imdbRating': imdbRating,
        'timing': timing,
        'description': description,
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getFavorites() async {
    try {
      QuerySnapshot snapshot = await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .get();

      final favouritesList = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>? ?? {};

        debugPrint("Полученные данные: $data"); // Проверяем, есть ли null

        return {
          'id': data['id'] ?? 0,
          'name': data['name'] ?? '',
          'release': data['release'] ?? '',
          'imdbRating': data['imdbRating'] ?? '',
          'timing': data['timing'] ?? '',
          'description': data['description'] ?? '',
        };
      }).toList();

      return favouritesList;
    } on FirebaseException catch (e) {
      debugPrint("Ошибка при получении избранного: ${e.message}");
      throw e.message.toString();
    }
  }

  @override
  Future<void> deleteFavorite(String name) async {
    try {
      await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .doc(name)
          .delete();

      debugPrint("Удалено из избранного: $name");
    } on FirebaseException catch (e) {
      debugPrint("Ошибка при удалении из избранного: ${e.message}");
      throw e.message.toString();
    }
  }
}
