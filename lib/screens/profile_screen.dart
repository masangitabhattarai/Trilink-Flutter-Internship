import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF1A1A2E),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color(0xFF1A1A2E)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top white section with avatar
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 24, bottom: 32),
              child: Center(
                child: Stack(
                  children: [
                    // Avatar circle
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF4361EE).withOpacity(0.2),
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Container(
                          color: const Color(0xFFE8ECFF),
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Color(0xFF4361EE),
                          ),
                        ),
                      ),
                    ),
                    // Edit icon
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 16,
                          color: Color(0xFF4361EE),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Personal Info Card
            _InfoCard(
              title: 'Personal info',
              actionLabel: 'Edit',
              onAction: () {},
              items: const [
                _InfoItem(
                  icon: Icons.person_outline_rounded,
                  label: 'Name',
                  value: 'Terry Melton',
                ),
                _InfoItem(
                  icon: Icons.mail_outline_rounded,
                  label: 'E-mail',
                  value: 'melton89@gmail.com',
                ),
                _InfoItem(
                  icon: Icons.phone_outlined,
                  label: 'Phone number',
                  value: '+1 201 555-0123',
                ),
                _InfoItem(
                  icon: Icons.home_outlined,
                  label: 'Home address',
                  value: '70 Rainey Street, Apartment 146,\nAustin TX 78701',
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Account Info Card
            _InfoCard(
              title: 'Account info',
              items: const [
                _InfoItem(
                  icon: Icons.shield_outlined,
                  label: 'Member since',
                  value: 'January 2022',
                ),
                _InfoItem(
                  icon: Icons.verified_outlined,
                  label: 'Account status',
                  value: 'Verified',
                ),
                _InfoItem(
                  icon: Icons.credit_card_outlined,
                  label: 'Subscription',
                  value: 'Premium Plan',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Logout button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout_rounded, color: Colors.red),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF4361EE),
        unselectedItemColor: const Color(0xFF9CA3AF),
        currentIndex: 4,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map_rounded),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_outlined),
            activeIcon: Icon(Icons.swap_horiz_rounded),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  final List<_InfoItem> items;

  const _InfoCard({
    required this.title,
    required this.items,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                if (actionLabel != null)
                  GestureDetector(
                    onTap: onAction,
                    child: Text(
                      actionLabel!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4361EE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            ...items.map((item) => _buildItem(item)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(_InfoItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, size: 20, color: const Color(0xFF6B7280)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1A1A2E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
