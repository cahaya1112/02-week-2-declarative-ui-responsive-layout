import 'package:flutter/material.dart';
import '../../models/room_session.dart';
import 'package:poliwangi_mobile_starter/widgets/room_session_card.dart';

class RuangPraktikum extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const RuangPraktikum({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<RuangPraktikum> createState() => _RuangPraktikumState();
}

class _RuangPraktikumState extends State<RuangPraktikum> {
  String? selectedCategory;
  SessionStatus? selectedStatus;

  List<RoomSession> get _filteredSessions {
    return dummyRoomSessions.where((session) {
      final matchCategory =
          selectedCategory == null ||
          session.namaRuang == selectedCategory;

      final matchStatus =
          selectedStatus == null ||
          session.status == selectedStatus;

      return matchCategory && matchStatus;
    }).toList();
  }

  void _showSessionDetail(RoomSession session) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        bool isFavorite = false;

        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      session.namaKegiatan,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            session.namaRuang,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            session.waktu,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(Icons.info_outline),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: _statusColor(session.status),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            session.status.label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Text(
                      'Deskripsi',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      session.deskripsi,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 16),

                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Tandai sebagai favorit'),
                      subtitle: const Text(
                        'Kontrol lokal pada detail kegiatan',
                      ),
                      value: isFavorite,
                      onChanged: (value) {
                        setSheetState(() {
                          isFavorite = value;
                        });
                      },
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Tutup'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Color _statusColor(SessionStatus status) {
    switch (status) {
      case SessionStatus.berlangsung:
        return Colors.blue;
      case SessionStatus.akanDatang:
        return Colors.orange;
      case SessionStatus.selesai:
        return Colors.grey;
      case SessionStatus.tersedia:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<RoomSession> sessions = _filteredSessions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('M02-2038 — RuangKita Workshop'),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: widget.isDarkMode
                ? 'Aktifkan Light Mode'
                : 'Aktifkan Dark Mode',
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFilterSection(),

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double width = constraints.maxWidth;

                  if (sessions.isEmpty) {
                    return const Center(
                      child: Text(
                        'Tidak ada data yang cocok dengan filter.',
                      ),
                    );
                  }

                  // Compact: < 600 dp
                  if (width < 600) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: sessions.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return RoomSessionCard(
                          session: sessions[index],
                          onTap: () {
                            _showSessionDetail(sessions[index]);
                          },
                        );
                      },
                    );
                  }

                  // Medium: 600 - 839 dp
                  if (width < 840) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: sessions.length,
                      itemBuilder: (context, index) {
                        return RoomSessionCard(
                          session: sessions[index],
                          onTap: () {
                            _showSessionDetail(sessions[index]);
                          },
                        );
                      },
                    );
                  }

                  // Expanded: >= 840 dp
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      return RoomSessionCard(
                        session: sessions[index],
                        onTap: () {
                          _showSessionDetail(sessions[index]);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    final List<String> categories = dummyRoomSessions
        .map((session) => session.namaRuang)
        .toSet()
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kategori',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 6),

          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              ChoiceChip(
                label: const Text('Semua'),
                selected: selectedCategory == null,
                onSelected: (_) {
                  setState(() {
                    selectedCategory = null;
                  });
                },
              ),

              for (final category in categories)
                ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (_) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            'Status',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 6),

          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              ChoiceChip(
                label: const Text('Semua'),
                selected: selectedStatus == null,
                onSelected: (_) {
                  setState(() {
                    selectedStatus = null;
                  });
                },
              ),

              for (final status in SessionStatus.values)
                ChoiceChip(
                  label: Text(status.label),
                  selected: selectedStatus == status,
                  onSelected: (_) {
                    setState(() {
                      selectedStatus = status;
                    });
                  },
                ),
            ],
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}