import 'package:flutter/material.dart';

class MoodChangerWidget extends StatefulWidget {
  final String username;

  const MoodChangerWidget({super.key, required this.username});

  @override
  State<MoodChangerWidget> createState() => _MoodChangerWidgetState();
}

class _MoodChangerWidgetState extends State<MoodChangerWidget> {
  final List<String> moods = ['Feliz', 'Triste', 'Enojado'];
  String _selectedMood = 'Feliz';

  @override
  void initState() {
    super.initState();
    print('initState: Bienvenido ${widget.username}');
  }

  @override
  void dispose() {
    print('dispose: Hasta luego ${widget.username}');
    super.dispose();
  }

  void _onMoodChanged(String? newMood) {
    if (newMood == null) return;

    setState(() {
      _selectedMood = newMood;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Estado de ánimo cambiado a: $_selectedMood')),
    );
  }

  void _sendHug() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Abrazo enviado!')),
    );
  }

  IconData _getMoodIcon() {
    switch (_selectedMood) {
      case 'Feliz':
        return Icons.sentiment_satisfied_alt;
      case 'Triste':
        return Icons.sentiment_dissatisfied;
      case 'Enojado':
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.help_outline;
    }
  }

  Color _getMoodColor() {
    switch (_selectedMood) {
      case 'Feliz':
        return Colors.green.shade100;
      case 'Triste':
        return Colors.blue.shade100;
      case 'Enojado':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  String _getMoodMessage() {
  switch (_selectedMood) {
    case 'Feliz':
      return 'Hoy estás: Feliz ☀️';
    case 'Triste':
      return 'Hoy estás: Triste 🌧️';
    case 'Enojado':
      return 'Hoy estás: Enojado 🔥';
    default:
      return 'Hoy estás: ???';
  }

  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getMoodColor(),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hola, ${widget.username} 👋', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          DropdownButton<String>(
            value: _selectedMood,
            onChanged: _onMoodChanged,
            items: moods
                .map((mood) => DropdownMenuItem(value: mood, child: Text(mood)))
                .toList(),
          ),
          const SizedBox(height: 24),
          Icon(_getMoodIcon(), size: 64),
          const SizedBox(height: 12),
          Text(
            _getMoodMessage(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (_selectedMood == 'Triste') ...[
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _sendHug,
              icon: const Icon(Icons.favorite),
              label: const Text('Necesito un abrazo ❤️'),
            ),
          ],
        ],
      ),
    );
  }
}
