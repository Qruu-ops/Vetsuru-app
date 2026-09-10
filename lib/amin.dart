import 'package:flutter/material.dart';

void main() {
  runApp(const VetSuruApp());
}

class VetSuruApp extends StatelessWidget {
  const VetSuruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetSürü / HerdPulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.light,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    CattleListScreen(),
    WeeklyScheduleScreen(),
    FinancialScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Özet',
          ),
          NavigationDestination(
            icon: Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.pets),
            label: 'Sürü',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Takvim',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Finans',
          ),
        ],
      ),
    );
  }
}

// 1. ÖZET EKRANI
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VetSürü Ana Panel'),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.blue.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  Text('Çiftlik Durumu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Toplam Sağmal: 45 | Kuru: 10 | Gebe: 30'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Veteriner Uyarıları (Bu Hafta)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.event_repeat, color: Colors.orange),
            title: Text('Gebelik Kontrolü Zamanı Gelenler'),
            subtitle: Text('TR42001, TR42005 (DSI > 40 gün)'),
          ),
          const ListTile(
            leading: Icon(Icons.water_drop, color: Colors.blue),
            title: Text('Kuruya Alınacak İnekler'),
            subtitle: Text('TR42012 (Gebelikte 220. gün)'),
          ),
        ],
      ),
    );
  }
}

// 2. SÜRÜ LİSTESİ EKRANI
class CattleListScreen extends StatelessWidget {
  const CattleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sürü Yönetimi')),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Text('42')),
            title: Text('TR42001 - Sarıkız'),
            subtitle: Text('DIM: 120 gün | DSI: 45 gün (Gebe)'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Text('43')),
            title: Text('TR42002 - Papatya'),
            subtitle: Text('DIM: 45 gün | Tohumlanmadı'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 3. HAFTALIK PROGRAM EKRANI
class WeeklyScheduleScreen extends StatelessWidget {
  const WeeklyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Haftalık Veteriner Takvimi')),
      body: const Center(
        child: Text('Çiftlik Protokolleri ve Haftalık Aşı/Muayene Listesi'),
      ),
    );
  }
}

// 4. FİNANS EKRANI
class FinancialScreen extends StatelessWidget {
  const FinancialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finans ve Maliyet Takibi')),
      body: const Center(
        child: Text('Yem, İlaç ve Süt Geliri Analizi'),
      ),
    );
  }
}
