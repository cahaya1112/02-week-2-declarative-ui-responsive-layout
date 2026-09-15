import 'package:flutter/material.dart';

class SesiPraktikum {
  final String title;
  final String time;
  final String room;
  final String status; // berlangsung, akan_datang, selesai, tersedia
  final String note;
  final IconData noteIcon;

  const SesiPraktikum({
    required this.title,
    required this.time,
    required this.room,
    required this.status,
    required this.note,
    required this.noteIcon,
  });
}

class RuangPraktikum extends StatefulWidget {
  const RuangPraktikum({super.key});

  @override
  State<RuangPraktikum> createState() => _RuangPraktikumState();
}

class _RuangPraktikumState extends State<RuangPraktikum> {
  final List<SesiPraktikum> daftarSesi = const [
    SesiPraktikum(
      title: 'Mobile Programming',
      time: '08.00 - 10.00',
      room: 'Lab 1',
      status: 'berlangsung',
      note: 'Sedang digunakan oleh praktikan',
      noteIcon: Icons.group,
    ),
    SesiPraktikum(
      title: 'Rekayasa Perangkat Lunak',
      time: '10.00 - 12.00',
      room: 'Lab 2',
      status: 'akan_datang',
      note: 'Sesi akan dimulai sebentar lagi',
      noteIcon: Icons.access_time,
    ),
    SesiPraktikum(
      title: 'Basis Data',
      time: '13.00 - 15.00',
      room: 'Lab 3',
      status: 'selesai',
      note: 'Sesi telah selesai',
      noteIcon: Icons.check_circle,
    ),
    SesiPraktikum(
      title: 'Lab 2',
      time: '',
      room: 'Ruang tersedia di luar jadwal sesi',
      status: 'tersedia',
      note: 'Siap digunakan untuk praktikum lain',
      noteIcon: Icons.meeting_room,
    ),
  ];

  Widget _buildInfoPill({
    required IconData icon,
    required String label,
    required Color bg,
    required Color fg,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fg),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: fg, fontWeight: FontWeight.w600, fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ruang Praktikum Hari Ini',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildInfoPill(
                    icon: Icons.calendar_today,
                    label: '3 sesi',
                    bg: Colors.blue.shade50,
                    fg: Colors.blue.shade700,
                  ),
                  const SizedBox(width: 8),
                  _buildInfoPill(
                    icon: Icons.event_available,
                    label: '1 ruang tersedia',
                    bg: Colors.green.shade50,
                    fg: Colors.green.shade700,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isWide = constraints.maxWidth >= 700;

                    if (isWide) {
                      // Layout tablet/desktop: grid 2x2, mengisi penuh layar, tanpa scroll
                      return Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: _SesiCard(sesi: daftarSesi[0])),
                                const SizedBox(width: 12),
                                Expanded(child: _SesiCard(sesi: daftarSesi[1])),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: _SesiCard(sesi: daftarSesi[2])),
                                const SizedBox(width: 12),
                                Expanded(child: _SesiCard(sesi: daftarSesi[3])),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    // Layout HP: 1 kolom, boleh scroll jika kepanjangan
                    return ListView.separated(
                      itemCount: daftarSesi.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => SizedBox(
                        height: 170,
                        child: _SesiCard(sesi: daftarSesi[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SesiCard extends StatelessWidget {
  final SesiPraktikum sesi;
  const _SesiCard({required this.sesi});

  Map<String, dynamic> get _statusStyle {
    switch (sesi.status) {
      case 'berlangsung':
        return {'label': 'Berlangsung', 'bg': Colors.blue, 'fg': Colors.white};
      case 'akan_datang':
        return {'label': 'Akan datang', 'bg': Colors.orange.shade100, 'fg': Colors.orange.shade900};
      case 'selesai':
        return {'label': 'Selesai', 'bg': Colors.grey.shade300, 'fg': Colors.grey.shade800};
      case 'tersedia':
        return {'label': 'Tersedia', 'bg': Colors.green, 'fg': Colors.white};
      default:
        return {'label': '', 'bg': Colors.grey, 'fg': Colors.white};
    }
  }

  Color get _noteBg {
    switch (sesi.status) {
      case 'berlangsung':
        return Colors.blue.shade50;
      case 'akan_datang':
        return Colors.orange.shade50;
      case 'selesai':
        return Colors.grey.shade100;
      case 'tersedia':
        return Colors.green.shade50;
      default:
        return Colors.grey.shade100;
    }
  }

  Color get _noteFg {
    switch (sesi.status) {
      case 'berlangsung':
        return Colors.blue.shade800;
      case 'akan_datang':
        return Colors.orange.shade800;
      case 'selesai':
        return Colors.grey.shade700;
      case 'tersedia':
        return Colors.green.shade800;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = _statusStyle;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    sesi.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: status['bg'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status['label'],
                    style: TextStyle(color: status['fg'], fontSize: 9, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (sesi.time.isNotEmpty) ...[
              Row(
                children: [
                  Icon(Icons.access_time, size: 12, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(sesi.time, style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
                ],
              ),
              const SizedBox(height: 6),
            ],
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 12, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    sesi.room,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              decoration: BoxDecoration(color: _noteBg, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(sesi.noteIcon, size: 13, color: _noteFg),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      sesi.note,
                      style: TextStyle(fontSize: 9.5, color: _noteFg, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}