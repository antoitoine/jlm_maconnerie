import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JLM Maçonnerie',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.black)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Go to 2nd Screen')
        )
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go to 1st Screen')
        )
      )
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  static const double appBarHeight = 80;

  final String _phoneNumber = "0681795282";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF1A1A1A),
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 12.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey.withValues(alpha: 0.2),
          height: 1.0,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/images/icon.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              const Text(
                'JLM Maçonnerie',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF555555), // Couleur plus douce
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                child: const Text("Photos"),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF555555),
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                child: const Text("Contacts"),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
                child: ElevatedButton.icon(
                  onPressed: _launchPhoneCall,
                  icon: const Icon(Icons.phone, size: 16, color: Colors.white),
                  label: const Text(
                    "01 02 03 04 05",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD62700),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchPhoneCall() async {
    if (!await launchUrl(Uri.parse("tel://$_phoneNumber"))) {
      throw Exception('Could not call $_phoneNumber');
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

