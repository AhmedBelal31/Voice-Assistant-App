import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant/openai_service.dart';
import 'package:voice_assistant/theme/pallete.dart';
import 'package:voice_assistant/theme/styles.dart';
import 'widgets/assistant_image.dart';
import 'widgets/features_box.dart';
import 'widgets/help_box.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  bool speechEnabled = false;
  String lastWords = '';
  final OpenAiService openAiService = OpenAiService();
  String? generatedContent;
  String? generatedImageUrl;
  var TFF = TextEditingController();
  bool isLoading = false;

  String result = '';
  String speech = '';
  String textFormFieldValue = '';

  @override
  void initState() {
    _initSpeech();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const Icon(Icons.menu),
        title: BounceInDown(child: const Text('Allen')),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZoomIn(child: const AssistantImage()),
              const SizedBox(height: 40),
              if (generatedImageUrl != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(generatedImageUrl!)),
                ),
              if (generatedImageUrl == null)
                FadeInRight(child: HelpBox(generatedContent: generatedContent)),
              const SizedBox(height: 20),
              SlideInLeft(
                child: TextFormField(
                  controller: TextEditingController(),
                  onChanged: (value) {
                    textFormFieldValue = value;
                  },
                  onFieldSubmitted: (_) async {
                    setState(() {
                      isLoading = true;
                    });
                    final result =
                        await openAiService.isArtPromptAPI(textFormFieldValue);
                    if (result.contains('https')) {
                      generatedImageUrl = result;
                      generatedContent = null;
                      setState(() {
                        isLoading = false;
                        print(isLoading);
                      });
                    } else {
                      generatedImageUrl = null;
                      generatedContent = result;
                      TFF.clear();
                      isLoading = false;
                      await systemSpeak(result);
                      setState(() {});
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        result = await openAiService
                            .isArtPromptAPI(textFormFieldValue);
                        print('The Query You enter is ${textFormFieldValue}');
                        if (result.contains('https')) {
                          generatedImageUrl = result;
                          generatedContent = null;
                          setState(() {});
                        } else {
                          generatedImageUrl = null;
                          generatedContent = result;
                          await systemSpeak(result);
                          TFF.clear();
                          isLoading = false;
                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Pallete.firstSuggestionBoxColor,
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading == true && result == '')
                const Center(
                    child: CircularProgressIndicator(
                  color: Pallete.firstSuggestionBoxColor,
                )),
              const SizedBox(height: 20),
              if (generatedImageUrl == null && generatedContent == null)
                SlideInLeft(
                  child: const Text('Here ara a few features ',
                      style: Styles.textStyle20),
                ),
              const SizedBox(height: 20),
              if (generatedImageUrl == null && generatedContent == null)
                const FeaturesBox(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          //openAiService.isArtPromptAPI('image');
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            setState(() {
              isLoading = true;
            });
            speech = await openAiService.isArtPromptAPI(lastWords);

            if (speech.contains('https')) {
              generatedImageUrl = speech;
              generatedContent = null;
              setState(() {});
            } else {
              generatedImageUrl = null;
              generatedContent = speech;
              setState(() {});
              await systemSpeak(speech);
            }
            await stopListening();
            // await stopSpeak();
          } else {
            _initSpeech();
          }
        },
        child: Icon(speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }

  void _initSpeech() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
    print(lastWords);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  Future stopSpeak() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    speechToText.stop();
    flutterTts.stop();
    super.dispose();
  }
}
