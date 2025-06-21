import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vokabel/models/word.dart';
import 'package:vokabel/services/isar_service.dart';

class WordAdd extends StatefulWidget {
  final IsarService isarService;
  final VoidCallback onSave;
  final Word? wordToEdit;
  const WordAdd({
    super.key,
    required this.isarService,
    required this.onSave,
    this.wordToEdit,
  });

  @override
  State<WordAdd> createState() => _WordAddState();
}

class _WordAddState extends State<WordAdd> {
  final _formKey = GlobalKey<FormState>();
  final _englishController = TextEditingController();
  final _turkishController = TextEditingController();
  final _germanController = TextEditingController();

  final _storyController = TextEditingController();
  String _selectedWorldType = "Noun";
  bool _isLearned = false;

  File? _imageFile;
  final ImagePicker _picture = ImagePicker();

  List<String> wordType = [
    "Noun",
    "Adjective",
    "Verb",
    "Phrasal Verb",
    "Idiom",
  ];

  @override
  void initState() {
    super.initState();
    if (widget.wordToEdit != null) {
      var updateWord = widget.wordToEdit;
      _englishController.text = updateWord!.englishWord;
      _turkishController.text = updateWord.turkischWord;
      _storyController.text = updateWord.storyWord!;
      _isLearned = updateWord.isLearned;
      _selectedWorldType = updateWord.wordType;
    }
  }

  Future<void> _selectPic() async {
    final image = await _picture.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future<void> _saveWord() async {
    //currentState, Formun mevcut (şu anki) durumuna erişim sağlar
    if (_formKey.currentState!.validate()) {
      //validate(), Bu metod, formdaki tüm TextFormField gibi alanların validator fonksiyonlarını çalıştırır.
      var _firstWord = _englishController.text;
      var _secondWord = _turkishController.text;
      var _story = _storyController.text;
      var word = Word(
        englishWord: _firstWord,
        turkischWord: _secondWord,
        wordType: _selectedWorldType,
        isLearned: _isLearned,
        storyWord: _story,
      );
      if (widget.wordToEdit == null) {
        word.imageBytes =
            _imageFile != null ? await _imageFile?.readAsBytes() : null;

        await widget.isarService.saveWord(word);
      } else {
        word.id = widget.wordToEdit!.id;
        word.imageBytes =
            _imageFile != null
                ? await _imageFile?.readAsBytes()
                : widget.wordToEdit?.imageBytes;
        await widget.isarService.saveWord(word);
      }
      debugPrint(
        "Entered Data: $_firstWord $_secondWord $_story $_isLearned $_selectedWorldType,",
      );
      widget.onSave();
    }
  }

  @override
  void dispose() {
    _englishController.dispose();
    _turkishController.dispose();
    _germanController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:
            widget.wordToEdit != null
                ? Text(
                  "Update Word",
                  style: Theme.of(context).textTheme.displaySmall,
                )
                : Text(
                  "Add Word",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BuildTextField(controller: _englishController, label: "1.Word"),
                BuildTextField(controller: _turkishController, label: "2.Word"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      label: Text("Word Type"),
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedWorldType,
                    items:
                        wordType.map((e) {
                          return DropdownMenuItem<Object>(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedWorldType = value as String;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 3,
                    maxLength: 100,
                    controller: _storyController,
                    decoration: InputDecoration(
                      labelText: "Notes",
                      //  prefixIcon: Icon(icon),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SwitchListTile(
                  title: Text("Learned: "),
                  value: _isLearned,
                  onChanged: (value) {
                    setState(() {
                      _isLearned = !_isLearned;
                    });
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: _selectPic,
                  label: Text("Add a Picture"),
                ),
                if (_imageFile != null ||
                    widget.wordToEdit?.imageBytes != null) ...[
                  if (_imageFile != null)
                    Image.file(_imageFile!, height: 150, fit: BoxFit.cover)
                  else if (widget.wordToEdit?.imageBytes != null)
                    Image.memory(
                      Uint8List.fromList(widget.wordToEdit!.imageBytes!),
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                ],

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _saveWord,
                  child:
                      widget.wordToEdit == null
                          ? Text("Save the word")
                          : Text("Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const BuildTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          //  prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty!';
          }
          return null;
        },
      ),
    );
  }
}
