import 'package:flutter/material.dart';

void main() {
  runApp(const VetSuruApp());
}

class VetSuruApp extends StatelessWidget {
  const VetSuruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetSürü - HerdPulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ViziteTakvimiPage(),
    const HayvanListesiPage(),
    const BuzagiProtocolPage(),
    const KarZararPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VetSürü / HerdPulse'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Vizite'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Hayvanlar'),
          BottomNavigationBarItem(icon: Icon(Icons.child_care), label: 'Buzağı Takip'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Kar-Zarar'),
        ],
      ),
    );
  }
}

class ViziteTakvimiPage extends StatelessWidget {
  const ViziteTakvimiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _buildDayCard(
          'Pazartesi Vizitesi',
          Colors.blue.shade100,
          [
            '15-22 SGS: Metrit / İltihap Kontrolü',
            '30-37 SGS: İnvolusyon / Uterus Kontrolü',
          ],
        ),
        _buildDayCard(
          'Salı Vizitesi',
          Colors.orange.shade100,
          [
            '60 SGS: Boş/Açık/Kötü Hayvanlar -> Senkronizasyon Protokolüne Al',
          ],
        ),
        _buildDayCard(
          'Çarşamba Vizitesi',
          Colors.purple.shade100,
          [
            'Toplu Aşılama & Buzağı Aşılama Günü',
          ],
        ),
        _buildDayCard(
          'Perşembe Vizitesi (Gebelik & Kuru & Trans)',
          Colors.green.shade100,
          [
            '30-37 TGS: 1. Gebelik Ultrason Kontrolü',
            '60-67 TGS: 2. Gebelik Kontrolü',
            '203-210 TGS: Kurudaki Gebelik Kontrolü',
            '210 TGS: Kuruya Alma (Rota-Corona Aşısı Eklesin)',
            '250 TGS: Transa Alma & Rotavec Aşısı Uygulama',
            '262 TGS (Son 21 Gün): Doğumhaneye / Transa Al Uyarısı',
          ],
        ),
        _buildDayCard(
          'Cuma Vizitesi',
          Colors.red.shade100,
          [
            'Tekrar Tohumlama Uyarısı & Takibi',
          ],
        ),
      ],
    );
  }

  Widget _buildDayCard(String title, Color color, List<String> tasks) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: tasks.map((task) => ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(task),
        )).toList(),
      ),
    );
  }
}

class HayvanListesiPage extends StatelessWidget {
  const HayvanListesiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _buildAnimalCard('TR-42001892', 'Sağmal', 142, 34, 'TOHUMLU', Colors.blue),
        _buildAnimalCard('TR-42001905', 'Sağmal', 215, 210, 'GEBE', Colors.green),
        _buildAnimalCard('TR-42002011', 'Kuru', 0, 252, 'GEBE (Transa Alındı)', Colors.orange),
      ],
    );
  }

  Widget _buildAnimalCard(String tag, String status, int dim, int dsi, String repStatus, Color color) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(tag, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('SGS (DIM): $dim Gün | TGS (DSI): $dsi Gün'),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
          child: Text(repStatus, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class BuzagiProtocolPage extends StatelessWidget {
  const BuzagiProtocolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        ListTile(leading: CircleAvatar(child: Text('0G')), title: Text('Septiserum + Göbek Dezenfeksiyonu'), subtitle: Text('ADEmin - Yeldif / Ağız sütü >= 27 Brix')),
        Divider(),
        ListTile(leading: CircleAvatar(child: Text('5G')), title: Text('Nazal Aşı Uyarısı')),
        Divider(),
        ListTile(leading: CircleAvatar(child: Text('7G')), title: Text('Göbek Enfeksiyonu Kontrolü')),
        Divider(),
        ListTile(leading: CircleAvatar(child: Text('10G')), title: Text('Boynuz Yakma Uyarısı')),
        Divider(),
        ListTile(leading: CircleAvatar(child: Text('21G')), title: Text('Toplaştırma & Yeme Alıştırma (Grup Değişimi)')),
      ],
    );
  }
}

class KarZararPage extends StatelessWidget {
  const KarZararPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Colors.teal.shade50,
            child: const ListTile(
              title: Text('Aylık Süt Geliri'),
              subtitle: Text('Satılan: Fabrika A.Ş.'),
              trailing: Text('+45.000 ₺', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          Card(
            color: Colors.red.shade50,
            child: const ListTile(
              title: Text('Aylık Yem & Masraflar'),
              subtitle: Text('Ham madde + Vet + Elektrik/Su'),
              trailing: Text('-28.500 ₺', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
