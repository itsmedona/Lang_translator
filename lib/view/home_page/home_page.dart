import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts package

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final outputController = TextEditingController(text: "Result here....");
  final translator = GoogleTranslator();

  String inputText = '';
  String inputLang = 'en';
  String outputLang = 'fr';

  Future<void> translateText() async {
    try {
      final translated = await translator.translate(
        inputText,
        from: inputLang,
        to: outputLang,
      );
      setState(() {
        outputController.text = translated.text;
        // Clear the input text if you want to reset the input field after translation
        // inputText = '';
      });
    } catch (e) {
      setState(() {
        outputController.text = 'Error occurred during translation';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Lingua Magic',
          style: GoogleFonts.pacifico(
            fontSize: 24, // Adjust the size as needed
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/translation_image.png',
                  fit: BoxFit.contain,
                  height: 250,
                ),
                SizedBox(height: 20),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the text to translate",
                  ),
                  onChanged: (value) {
                    setState(() {
                      inputText = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: inputLang,
                      onChanged: (newValue) {
                        setState(() {
                          inputLang = newValue!;
                        });
                      },
                      items: <String>[
                        'en',
                        'fr',
                        'es',
                        'de',
                        'ur',
                        'hi',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: outputLang,
                      onChanged: (newValue) {
                        setState(() {
                          outputLang = newValue!;
                        });
                      },
                      items: <String>[
                        'en',
                        'fr',
                        'es',
                        'de',
                        'ur',
                        'hi',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: translateText,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(55),
                  ),
                  child: Text('Translate'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: outputController,
                  readOnly: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Translated Text is here",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
