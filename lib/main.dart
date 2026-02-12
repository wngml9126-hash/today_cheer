import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const TodayCheerApp());
}

class TodayCheerApp extends StatelessWidget {
  const TodayCheerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오늘의 응원',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB7B2), // Pastel Pink/Peach seed
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF0F5), // Lavender Blush
      ),
      home: const CheerPage(),
    );
  }
}

class CheerPage extends StatefulWidget {
  const CheerPage({super.key});

  @override
  State<CheerPage> createState() => _CheerPageState();
}

class _CheerPageState extends State<CheerPage> {
  final List<String> _cheerMessages = [
    "당신은 충분히 잘하고 있어요.",
    "오늘도 좋은 일이 생길 거예요.",
    "작은 진전도 큰 성공의 시작입니다.",
    "힘내세요! 당신의 노력이 빛을 발할 거예요.",
    "긍정적인 마음이 기적을 만듭니다.",
    "실수해도 괜찮아요, 그것도 성장의 일부니까요.",
    "당신의 미소는 세상을 밝게 합니다.",
    "오늘 하루도 당신의 것입니다. 마음껏 즐기세요!",
    "어려움은 곧 지나가고 더 좋은 날이 올 거예요.",
    "당신은 사랑받기 위해 태어난 사람입니다.",
  ];

  String _currentMessage = "";

  @override
  void initState() {
    super.initState();
    _pickRandomMessage();
  }

  void _pickRandomMessage() {
    setState(() {
      _currentMessage = _cheerMessages[Random().nextInt(_cheerMessages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF0F5), // Lavender Blush
              Color(0xFFE6E6FA), // Lavender
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon or Image could go here
                const Icon(
                  Icons.favorite,
                  color: Color(0xFFFF69B4),
                  size: 48,
                ),
                const SizedBox(height: 24),
                Text(
                  '오늘의 응원',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600],
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      _currentMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4A4A),
                        fontFamily: 'NanumGothic',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton.icon(
                  onPressed: _pickRandomMessage,
                  icon: const Icon(Icons.refresh),
                  label: const Text('새로운 응원 받기'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
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
