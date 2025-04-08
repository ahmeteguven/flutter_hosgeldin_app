//ERCİYES ÜNİVERSİTESİ, MÜHENDİSLİK FAKÜLTESİ, BİLGİSAYAR MÜHENDİSLİĞİ, MOBILE APP DEVELOPMENT, FEHİM KÖYLÜ
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Hoş Geldin',
      theme: ThemeData(
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isDialogShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showWelcomeDialog();
        _isDialogShown = true;
      });
    }
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("👋 Hoş Geldiniz!"),
        content: const Text("Uygulamamıza katıldığınız için çok mutluyuz.\nKeyifli kullanımlar!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Teşekkürler"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 12,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.flutter_dash, size: 64, color: Colors.deepPurple),
                  SizedBox(height: 16),
                  Text(
                    "Flutter Web'e Hoş Geldiniz!",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Bu uygulama Flutter ile geliştirilmiştir.\nBasit bir hoşgeldin mesajı içeriyor.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
