// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'word.g.dart';

@collection //Isar veritabanina karsilikli gelebilmesi icin @collection olsuturuyoruz
class Word {
  Id id =
      Isar.autoIncrement; // Her kelimenin kendisine özgü id si olacak. Isar.autoIncrement, id no kendisi belirleyecek
  late String englishWord;
  late String turkischWord;
  late String wordType;
  String? storyWord;
  List<int>? imageBytes;
  bool isLearned = false;
  DateTime createdAt = DateTime.now();
  Word({
    required this.englishWord,
    required this.turkischWord,
    required this.wordType,
    this.isLearned = false,
    this.storyWord,
    this.imageBytes,
  });

  @override
  String toString() {
    return 'Word(id: $id, englishWord: $englishWord, turkischWord: $turkischWord, wordType: $wordType, storyWord: $storyWord, imageBytes: $imageBytes, isLearned: $isLearned)';
  }
}
