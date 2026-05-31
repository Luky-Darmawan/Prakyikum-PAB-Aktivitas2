import 'package:flutter/material.dart';
import 'main_nav.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum PAB 2023',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7BC67E)),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to\n',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'PRAKTIKUM PAB 2023',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                '1462300060',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: 220,
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ..._buildBackgroundArrows(),
                    Container(
                      width: 130,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('assets/fotoku.jpg'),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 50,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 70,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Luky Darmawan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const Spacer(flex: 3),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNav(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7BC67E),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBackgroundArrows() {
    final List<Map<String, dynamic>> arrows = [
      {'left': 10.0, 'top': 20.0, 'color': const Color(0xFF7BC67E), 'size': 20.0, 'opacity': 0.6},
      {'left': 30.0, 'top': 5.0, 'color': const Color(0xFF7BC67E), 'size': 16.0, 'opacity': 0.4},
      {'right': 10.0, 'top': 15.0, 'color': const Color(0xFF7BC67E), 'size': 22.0, 'opacity': 0.7},
      {'right': 30.0, 'top': 0.0, 'color': const Color(0xFF7BC67E), 'size': 18.0, 'opacity': 0.5},
      {'left': 5.0, 'bottom': 30.0, 'color': Colors.grey, 'size': 18.0, 'opacity': 0.3},
      {'right': 5.0, 'bottom': 40.0, 'color': Colors.grey, 'size': 14.0, 'opacity': 0.25},
      {'left': 50.0, 'top': 0.0, 'color': Colors.grey, 'size': 12.0, 'opacity': 0.2},
      {'right': 50.0, 'bottom': 10.0, 'color': const Color(0xFF7BC67E), 'size': 14.0, 'opacity': 0.4},
    ];

    return arrows.map((arrow) {
      return Positioned(
        left: arrow['left'] as double?,
        right: arrow['right'] as double?,
        top: arrow['top'] as double?,
        bottom: arrow['bottom'] as double?,
        child: Opacity(
          opacity: arrow['opacity'] as double,
          child: Icon(
            Icons.arrow_upward_rounded,
            color: arrow['color'] as Color,
            size: arrow['size'] as double,
          ),
        ),
      );
    }).toList();
  }
}