import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4361EE), Color(0xFF3A0CA3)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4361EE).withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.code_rounded,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trilink Assignment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'May 2026 Batch',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              const Text(
                'Select a Task',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Tap any task below to navigate to that screen',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: [
                    _TaskButton(
                      taskNumber: '01',
                      title: 'Task 1 - Profile Page Design',
                      subtitle: 'View personal & account info',
                      icon: Icons.person_rounded,
                      color: const Color(0xFF4361EE),
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                    ),
                    const SizedBox(height: 16),
                    _TaskButton(
                      taskNumber: '02',
                      title: 'Task 2 - Login Page',
                      subtitle: 'Email & password validation',
                      icon: Icons.lock_rounded,
                      color: const Color(0xFF7209B7),
                      onTap: () => Navigator.pushNamed(context, '/login'),
                    ),
                    const SizedBox(height: 16),
                    _TaskButton(
                      taskNumber: '03',
                      title: 'Task 3 - API Integration',
                      subtitle: 'Fetch posts from JSONPlaceholder',
                      icon: Icons.cloud_download_rounded,
                      color: const Color(0xFF3ABEF9),
                      badge: 'Bonus',
                      onTap: () => Navigator.pushNamed(context, '/api'),
                    ),
                    const SizedBox(height: 16),
                    _TaskButton(
                      taskNumber: '04',
                      title: 'Task 4 - To-Do CRUD App',
                      subtitle: 'Add, edit, delete & complete tasks',
                      icon: Icons.checklist_rounded,
                      color: const Color(0xFF06D6A0),
                      badge: 'Bonus',
                      onTap: () => Navigator.pushNamed(context, '/todo'),
                    ),
                  ],
                ),
              ),

              // Footer
              Center(
                child: Text(
                  '© Trilink IT Solution Pvt Ltd',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskButton extends StatelessWidget {
  final String taskNumber;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? badge;
  final VoidCallback onTap;

  const _TaskButton({
    required this.taskNumber,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: color.withOpacity(0.15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                        ),
                        if (badge != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFA500).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              badge!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFFF57C00),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: color, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
