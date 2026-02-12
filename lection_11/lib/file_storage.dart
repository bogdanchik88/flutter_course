import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileNotePage extends StatefulWidget {
  const FileNotePage({super.key});

  @override
  State<FileNotePage> createState() => _FileNotePageState();
}

class _FileNotePageState extends State<FileNotePage> {
  final TextEditingController _controller = TextEditingController();
  String _status = '';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/note.txt');
  }

  Future<void> writeData(String text) async {
    final file = await _localFile;
    await file.writeAsString(text);
    setState(() {
      _status = "Заметка сохранена";
    });
  }

  Future<void> readData() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      setState(() {
        _controller.text = contents;
        _status = "Заметка загружена";
      });
    } catch (e) {
      setState(() {
        _status = "Файл пока пустой";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Блокнот (File)")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Введите текст",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => writeData(_controller.text),
              child: const Text("Сохранить"),
            ),
            const SizedBox(height: 10),
            Text(_status),
          ],
        ),
      ),
    );
  }
}
