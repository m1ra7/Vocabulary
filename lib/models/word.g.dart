// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordCollection on Isar {
  IsarCollection<Word> get words => this.collection();
}

const WordSchema = CollectionSchema(
  name: r'Word',
  id: 2997905348638732671,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'englishWord': PropertySchema(
      id: 1,
      name: r'englishWord',
      type: IsarType.string,
    ),
    r'imageBytes': PropertySchema(
      id: 2,
      name: r'imageBytes',
      type: IsarType.longList,
    ),
    r'isLearned': PropertySchema(
      id: 3,
      name: r'isLearned',
      type: IsarType.bool,
    ),
    r'storyWord': PropertySchema(
      id: 4,
      name: r'storyWord',
      type: IsarType.string,
    ),
    r'turkischWord': PropertySchema(
      id: 5,
      name: r'turkischWord',
      type: IsarType.string,
    ),
    r'wordType': PropertySchema(
      id: 6,
      name: r'wordType',
      type: IsarType.string,
    )
  },
  estimateSize: _wordEstimateSize,
  serialize: _wordSerialize,
  deserialize: _wordDeserialize,
  deserializeProp: _wordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _wordGetId,
  getLinks: _wordGetLinks,
  attach: _wordAttach,
  version: '3.1.0+1',
);

int _wordEstimateSize(
  Word object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.englishWord.length * 3;
  {
    final value = object.imageBytes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.storyWord;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.turkischWord.length * 3;
  bytesCount += 3 + object.wordType.length * 3;
  return bytesCount;
}

void _wordSerialize(
  Word object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.englishWord);
  writer.writeLongList(offsets[2], object.imageBytes);
  writer.writeBool(offsets[3], object.isLearned);
  writer.writeString(offsets[4], object.storyWord);
  writer.writeString(offsets[5], object.turkischWord);
  writer.writeString(offsets[6], object.wordType);
}

Word _wordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Word(
    englishWord: reader.readString(offsets[1]),
    imageBytes: reader.readLongList(offsets[2]),
    storyWord: reader.readStringOrNull(offsets[4]),
    turkischWord: reader.readString(offsets[5]),
    wordType: reader.readString(offsets[6]),
  );
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isLearned = reader.readBool(offsets[3]);
  return object;
}

P _wordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongList(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wordGetId(Word object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordGetLinks(Word object) {
  return [];
}

void _wordAttach(IsarCollection<dynamic> col, Id id, Word object) {
  object.id = id;
}

extension WordQueryWhereSort on QueryBuilder<Word, Word, QWhere> {
  QueryBuilder<Word, Word, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WordQueryWhere on QueryBuilder<Word, Word, QWhereClause> {
  QueryBuilder<Word, Word, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WordQueryFilter on QueryBuilder<Word, Word, QFilterCondition> {
  QueryBuilder<Word, Word, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'englishWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'englishWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'englishWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'englishWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'englishWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'englishWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'englishWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'englishWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'englishWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> englishWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'englishWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageBytes',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageBytes',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> imageBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> isLearnedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLearned',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storyWord',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storyWord',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storyWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storyWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storyWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storyWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storyWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storyWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storyWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storyWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storyWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> storyWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storyWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'turkischWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'turkischWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'turkischWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'turkischWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'turkischWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'turkischWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'turkischWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'turkischWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'turkischWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> turkischWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'turkischWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wordType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wordType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wordType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wordType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordType',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wordType',
        value: '',
      ));
    });
  }
}

extension WordQueryObject on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQueryLinks on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQuerySortBy on QueryBuilder<Word, Word, QSortBy> {
  QueryBuilder<Word, Word, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByEnglishWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishWord', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByEnglishWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishWord', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByIsLearnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByStoryWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyWord', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByStoryWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyWord', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByTurkischWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turkischWord', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByTurkischWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turkischWord', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByWordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByWordTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.desc);
    });
  }
}

extension WordQuerySortThenBy on QueryBuilder<Word, Word, QSortThenBy> {
  QueryBuilder<Word, Word, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByEnglishWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishWord', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByEnglishWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishWord', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIsLearnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByStoryWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyWord', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByStoryWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyWord', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByTurkischWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turkischWord', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByTurkischWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turkischWord', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByWordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByWordTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.desc);
    });
  }
}

extension WordQueryWhereDistinct on QueryBuilder<Word, Word, QDistinct> {
  QueryBuilder<Word, Word, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByEnglishWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'englishWord', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByImageBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageBytes');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLearned');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByStoryWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storyWord', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByTurkischWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'turkischWord', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByWordType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordType', caseSensitive: caseSensitive);
    });
  }
}

extension WordQueryProperty on QueryBuilder<Word, Word, QQueryProperty> {
  QueryBuilder<Word, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Word, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> englishWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'englishWord');
    });
  }

  QueryBuilder<Word, List<int>?, QQueryOperations> imageBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageBytes');
    });
  }

  QueryBuilder<Word, bool, QQueryOperations> isLearnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLearned');
    });
  }

  QueryBuilder<Word, String?, QQueryOperations> storyWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storyWord');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> turkischWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'turkischWord');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> wordTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordType');
    });
  }
}
