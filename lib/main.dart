import 'package:flutter/material.dart';
import 'package:vokabel/models/word.dart';
import 'package:vokabel/services/isar_service.dart';
import 'package:vokabel/screens/word_add_page.dart';
import 'package:vokabel/screens/word_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isarService = IsarService();
  try {
    await isarService.init();
    final words = await isarService.getAllWords();
    debugPrint(words.toString());
  } catch (e) {
    debugPrint("Error occurred! $e");
  }
  runApp(MyApp(isarService: isarService));
}

class MyApp extends StatelessWidget {
  final IsarService isarService;
  const MyApp({super.key, required this.isarService});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vokabel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: MainPage(isarService: isarService),
    );
  }
}

class MainPage extends StatefulWidget {
  final IsarService isarService;
  const MainPage({super.key, required this.isarService});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedScreen = 0;
  Word? _wordToEdit;

  void _onEditWord(Word updateWord) {
    setState(() {
      _selectedScreen = 1;
      _wordToEdit = updateWord;
    });
  }

  List<Widget> getScreens() {
    return [
      WorldList(isarService: widget.isarService, onEditWord: _onEditWord),
      WordAdd(
        isarService: widget.isarService,
        wordToEdit: _wordToEdit,
        onSave: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Word Saved!")));
          setState(() {
            _selectedScreen = 0;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreens()[_selectedScreen],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _selectedScreen = value;
            if (_selectedScreen == 0) {
              _wordToEdit = null;
            }
          });
        },
        selectedIndex: _selectedScreen,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.list_alt),
            label: "Words",
          ),
          NavigationDestination(
            icon: const Icon(Icons.add_circle_rounded),
            label: _wordToEdit == null ? "Add" : "Update",
          ),
        ],
      ),
    );
  }
}
