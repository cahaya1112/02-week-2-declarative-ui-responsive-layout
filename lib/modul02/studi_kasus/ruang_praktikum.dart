import 'package:flutter/material.dart';
import '../../models/room_session.dart';
import '../../widgets/room_session_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M02-2038 — RuangKita Workshop'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: widget.isDarkMode ? 'Aktifkan Light Mode' : 'Aktifkan Dark Mode',
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;

            if (width < 600) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: dummyRoomSessions.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final session = dummyRoomSessions[index];
                  return RoomSessionCard(session: session, onTap: () {});
                },
              );
            } else if (width < 840) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                itemCount: dummyRoomSessions.length,
                itemBuilder: (context, index) {
                  final session = dummyRoomSessions[index];
                  return RoomSessionCard(session: session, onTap: () {});
                },
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.3,
                ),
                itemCount: dummyRoomSessions.length,
                itemBuilder: (context, index) {
                  final session = dummyRoomSessions[index];
                  return RoomSessionCard(session: session, onTap: () {});
                },
              );
            }
          },
        ),
      ),
    );
  }
}