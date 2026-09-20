import 'package:flutter/material.dart';
import '../models/room_session.dart';

class RoomSessionCard extends StatelessWidget {
  final RoomSession session;
  final VoidCallback onTap;

  const RoomSessionCard({
    super.key,
    required this.session,
    required this.onTap,
  });

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
    final color = _statusColor(session.status);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 70, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.namaKegiatan,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 12, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          session.namaRuang,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(session.waktu, style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    session.deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  session.status.label,
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}