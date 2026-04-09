import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Color mainMagenta = const Color(0xFFE94057);
  double _distance = 50;
  RangeValues _ageRange = const RangeValues(24, 32);
  String _showMe = 'Women';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        leading: BackButton(color: mainMagenta),
        title: Text('Settings', style: TextStyle(color: mainMagenta, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('ACCOUNT'),
            _buildSettingsCard([
              _buildListTile('Phone Number', '+1 (555) 012-3456'),
              _buildListTile('Email', 'alex.rivera@gallery.io'),
              _buildListTile('Account ID', 'KINETIC-8829-XR', isCopyable: true),
            ]),
            const SizedBox(height: 25),
            _buildSectionTitle('DISCOVERY SETTINGS'),
            _buildSettingsCard([
              _buildListTile('Location', 'Brooklyn, NY', icon: Icons.location_on),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('Distance Preference', style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('${_distance.toInt()} miles', style: TextStyle(color: mainMagenta, fontWeight: FontWeight.bold)),
                  ]),
                  Slider(value: _distance, min: 0, max: 100, activeColor: mainMagenta, onChanged: (val) => setState(() => _distance = val)),
                ]),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('Age Range', style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('${_ageRange.start.toInt()} - ${_ageRange.end.toInt()}', style: TextStyle(color: mainMagenta, fontWeight: FontWeight.bold)),
                  ]),
                  RangeSlider(values: _ageRange, min: 18, max: 60, activeColor: mainMagenta, onChanged: (val) => setState(() => _ageRange = val)),
                ]),
              ),
            ]),
            const SizedBox(height: 25),
            _buildSectionTitle('SHOW ME'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Men', 'Women', 'Everyone'].map((type) => _buildTypeButton(type)).toList(),
            ),
            const SizedBox(height: 30),
            // --- Log Out Button ---
            SizedBox(
              width: double.infinity, height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFC5C5), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false),
                child: const Text('Log Out', style: TextStyle(color: Color(0xFFE94057), fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(padding: const EdgeInsets.only(left: 10, bottom: 10), child: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)));

  Widget _buildSettingsCard(List<Widget> children) => Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: Column(children: children));

  Widget _buildListTile(String title, String value, {bool isCopyable = false, IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: mainMagenta, size: 20) : null,
      title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
      trailing: Icon(isCopyable ? Icons.copy : Icons.chevron_right, color: Colors.grey[400]),
    );
  }

  Widget _buildTypeButton(String type) {
    bool isSel = _showMe == type;
    return GestureDetector(
      onTap: () => setState(() => _showMe = type),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28, height: 50,
        decoration: BoxDecoration(color: isSel ? mainMagenta : Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: [if (isSel) BoxShadow(color: mainMagenta.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))]),
        child: Center(child: Text(type, style: TextStyle(color: isSel ? Colors.white : Colors.grey, fontWeight: FontWeight.bold))),
      ),
    );
  }
}