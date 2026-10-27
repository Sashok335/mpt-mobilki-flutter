import 'package:flutter/material.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Заметки',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _editingController = TextEditingController();
  final List<String> _notes = [];
  int? _editingIndex;

  void _saveNote() {
    final text = _controller.text.trim();

    if (text.isEmpty) {
      return;
    }

    setState(() {
      _notes.insert(0, text);
      _controller.clear();
    });

    FocusScope.of(context).unfocus();
  }

  void _startEditing(int index) {
    setState(() {
      _editingIndex = index;
      _editingController.text = _notes[index];
    });
  }

  void _finishEditing() {
    final index = _editingIndex;
    final text = _editingController.text.trim();

    if (index == null) {
      return;
    }

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заметка не может быть пустой')),
      );
      return;
    }

    setState(() {
      _notes[index] = text;
      _editingIndex = null;
      _editingController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  void _cancelEditing() {
    setState(() {
      _editingIndex = null;
      _editingController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);

      if (_editingIndex == index) {
        _editingIndex = null;
        _editingController.clear();
      } else if (_editingIndex != null && _editingIndex! > index) {
        _editingIndex = _editingIndex! - 1;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои заметки')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Новая заметка',
                  hintText: 'Напишите что-нибудь...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveNote,
                  child: const Text('Сохранить'),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _notes.isEmpty
                    ? const Center(child: Text('Пока заметок нет'))
                    : ListView.separated(
                        itemCount: _notes.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: const Icon(Icons.description_outlined),
                              title: _editingIndex == index
                                  ? TextField(
                                      controller: _editingController,
                                      autofocus: true,
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    )
                                  : Text(_notes[index]),
                              trailing: _editingIndex == index
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          tooltip: 'Сохранить',
                                          icon: const Icon(Icons.check),
                                          onPressed: _finishEditing,
                                        ),
                                        IconButton(
                                          tooltip: 'Отмена',
                                          icon: const Icon(Icons.close),
                                          onPressed: _cancelEditing,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          tooltip: 'Редактировать',
                                          icon: const Icon(Icons.edit_outlined),
                                          onPressed: () => _startEditing(index),
                                        ),
                                        IconButton(
                                          tooltip: 'Удалить',
                                          icon: const Icon(
                                            Icons.delete_outline,
                                          ),
                                          onPressed: () => _deleteNote(index),
                                        ),
                                      ],
                                    ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
