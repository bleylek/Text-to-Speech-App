import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // enabling text-to-speech capabilities in the app

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text to Speech',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text to Speech'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(child: TextToSpeech()),
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts(); // to interact with the text-to-speech functionalities
  final TextEditingController textEditingController = TextEditingController(); // to control the text field.

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); // 0.5 to 1.5
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              textAlign: TextAlign.center,
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Enter your text here"),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              child: Text("Press Here"),
              onPressed: () => speak(textEditingController.text),
            )
          ],
        ),
      ),
    );
  }
}