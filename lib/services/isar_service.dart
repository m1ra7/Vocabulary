import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vokabel/models/word.dart';

class IsarService {
  late Isar isar;

  Future<void> init() async {
    //initi() uygulamayi acar acmaz verilerimizi veritabandan yüklemeye baslar
    try {
      final directory = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [WordSchema],
        directory: directory.path,
      ); //WordSchema uygulamda ne kadar sema ve tablo var onu aliyor
      debugPrint("Isar has been launched! ${directory.path}");
    } catch (e) {
      debugPrint("An error occurred while performing isar init! $e");
    }
  }

  Future<void> saveWord(Word word) async {
    try {
      await isar.writeTxn(() async {
        final id = await isar.words.put(word);

        debugPrint("New word ${word.englishWord} $id added with id");
      });
    } catch (e) {
      debugPrint("An error occurred while adding the word: $e");
    }
  }

  Future<void> deletWord(int id) async {
    try {
      await isar.writeTxn(() async {
        final result = await isar.words.delete(id);

        debugPrint("$id ID record deleted!");
      });
    } catch (e) {
      debugPrint("An error occurred while deleting a word $e");
    }
  }

  Future<List<Word>> getAllWords() async {
    try {
      final words = await isar.words.where().findAll();
      return words;
    } catch (e) {
      debugPrint("Error while fetching all words: $e");
      return [];
    }
  }

  Future<void> updateWord(Word word) async {
    try {
      await isar.writeTxn(() async {
        final id = await isar.words.put(word);

        debugPrint(
          "The word ${word.englishWord} has been updated with the id $id",
        );
      });
    } catch (e) {
      debugPrint("Updated the word and got an error: $e");
    }
  }

  Future<void> toggleWordLearned(int id) async {
    try {
      await isar.writeTxn(() async {
        final word = await isar.words.get(id);
        if (word != null) {
          word.isLearned = !word.isLearned;
          await isar.words.put(word);
          debugPrint(
            "The word ${word.englishWord} has been updated with the id $id",
          );
        } else {
          debugPrint("Word not found!");
        }
      });
    } catch (e) {
      debugPrint("An error occurred: $e");
    }
  }
}
