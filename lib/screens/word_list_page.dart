import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:vokabel/models/word.dart';
import 'package:vokabel/services/isar_service.dart';

class WorldList extends StatefulWidget {
  final IsarService isarService;
  final Function(Word) onEditWord;
  const WorldList({
    super.key,
    required this.isarService,
    required this.onEditWord,
  });

  @override
  State<WorldList> createState() => _WorldListState();
}

class _WorldListState extends State<WorldList> {
  late Future<List<Word>> _getAllWord;
  List<Word> _kelimeler = [];
  List<Word> _filtredWords = [];

  List<String> wordType = [
    "All",
    "Noun",
    "Adjective",
    "Verb",
    "Phrasal Verb",
    "Idiom",
  ];
  String _selectedWordType = "All";
  bool _showLearned = false;

  Future<List<Word>> _getWordsFromDB() async {
    var dbaWords = await widget.isarService.getAllWords();
    _kelimeler = dbaWords;
    return dbaWords;
  }

  @override //Sayfayi acarken sadece bir defa calisacak. O durumda verileri veri tabandan alacak.
  void initState() {
    super.initState();
    _getAllWord = _getWordsFromDB();
  }

  void _refreshWord() {
    //refrsh yapiyor
    setState(() {
      _getAllWord = _getWordsFromDB();
    });
  }

  void _deleteWord(Word word) async {
    await widget.isarService.deletWord(word.id);
    _kelimeler.removeWhere((element) => element.id == word.id);
    debugPrint("List size: ${_kelimeler.length}");
  }

  _toggleUpdateWord(Word onankiKelime) async {
    await widget.isarService.toggleWordLearned(onankiKelime.id);
    final index = _kelimeler.indexWhere(
      (element) => element.id == onankiKelime.id,
    );
    var degistirilecekKelime = _kelimeler[index];
    degistirilecekKelime.isLearned = !degistirilecekKelime.isLearned;
    _kelimeler[index] = degistirilecekKelime;
    setState(() {});
  }

  void _applyFilter() {
    _filtredWords = List.from(_kelimeler);
    if (_selectedWordType != "All") {
      _filtredWords =
          _filtredWords
              .where(
                (element) =>
                    element.wordType.toLowerCase() ==
                    _selectedWordType.toLowerCase(),
              )
              .toList();
    }
    if (_showLearned) {
      _filtredWords =
          _filtredWords
              .where((element) => element.isLearned != _showLearned)
              .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "My Vocabulary",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Column(
        children: [
          _buildFilterCard(),
          Expanded(
            child: FutureBuilder<List<Word>>(
              future: _getAllWord,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "An error occurred! ${snapshot.error.toString()}",
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return snapshot.data?.length == 0
                      ? Center(child: Text("No Word"))
                      : _buildListView(snapshot.data!);
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildFilterCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.filter_alt_outlined),
                  SizedBox(width: 10),

                  Text("Filter"),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        label: Text("choose"),
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedWordType,
                      items:
                          wordType
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedWordType = value!;
                          _applyFilter();
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Hide What I Learned:"),

                  Switch(
                    value: _showLearned,
                    onChanged: (value) {
                      setState(() {
                        _showLearned = !_showLearned;
                        _applyFilter();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildListView(List<Word> data) {
    _applyFilter();
    debugPrint("Word Length: ${_filtredWords.length}");
    return ListView.builder(
      itemCount: _filtredWords.length,
      itemBuilder: (context, index) {
        var onankiKelime = _filtredWords[index];
        return GestureDetector(
          onTap: () => widget.onEditWord(onankiKelime),
          child: Dismissible(
            //Silme islemi
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Word Deletion"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) => _deleteWord(onankiKelime),
            background: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
                child: Icon(Icons.delete, color: Colors.red),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(onankiKelime.englishWord),
                      leading: Chip(label: Text(onankiKelime.wordType)),
                      subtitle: Text(onankiKelime.turkischWord),
                      trailing: Switch(
                        value: onankiKelime.isLearned,
                        onChanged: (value) => _toggleUpdateWord(onankiKelime),
                        // async {await widget.isarService.toggleWordLearned(onankiKelime.id);_refreshWord();},
                      ),
                    ),
                    if (onankiKelime.storyWord != null &&
                        onankiKelime.storyWord!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer.withOpacity(0.6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.lightbulb),
                                    Text("Reminder Note: "),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    onankiKelime.storyWord ?? "",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (onankiKelime.imageBytes != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              Uint8List.fromList(onankiKelime.imageBytes!),
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
