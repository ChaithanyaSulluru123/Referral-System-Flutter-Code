
import 'package:flutter/material.dart';

class MyReferralsScreen extends StatefulWidget {
  const MyReferralsScreen({super.key});

  @override
  State<MyReferralsScreen> createState() => _MyReferralsScreenState();
}

class _MyReferralsScreenState extends State<MyReferralsScreen> {
  static const Color green = Color(0xFF21845F);
  static const Color darkText = Color(0xFF183B3B);

  String selectedStatus = 'All';

  final List<String> statuses = [
    'All',
    'Pending',
    'Approved',
    'Rejected',
    'Converted',
  ];

  void changeStatus(String status) {
    setState(() {
      selectedStatus = status;
    });
  }

  Map<String, dynamic> getEmptyState() {
    switch (selectedStatus) {
      case 'Pending':
        return {
          'icon': Icons.hourglass_empty,
          'title': 'No Pending Referrals',
          'description': 'You currently have no pending shop referrals.',
        };

      case 'Approved':
        return {
          'icon': Icons.check_circle_outline,
          'title': 'No Approved Referrals',
          'description': 'Your approved shop referrals will appear here.',
        };

      case 'Rejected':
        return {
          'icon': Icons.cancel_outlined,
          'title': 'No Rejected Referrals',
          'description': 'You currently have no rejected shop referrals.',
        };

      case 'Converted':
        return {
          'icon': Icons.storefront_outlined,
          'title': 'No Converted Referrals',
          'description': 'Your converted shop referrals will appear here.',
        };

      default:
        return {
          'icon': Icons.store_outlined,
          'title': 'No Referrals Yet',
          'description': 'Your submitted shop referrals will appear here.',
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final emptyState = getEmptyState();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FA),
        elevation: 0,
        title: const Text(
          'My Referrals',
          style: TextStyle(
            color: darkText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Track Your Referrals',
              style: TextStyle(
                color: darkText,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Monitor the status of your submitted shops.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 22),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search shop name',
                hintStyle: const TextStyle(fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: green),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Filter by Status',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: statuses.map((status) {
                  return StatusFilter(
                    label: status,
                    selected: selectedStatus == status,
                    onTap: () => changeStatus(status),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Referral History',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 14),

            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F4E8),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        emptyState['icon'] as IconData,
                        size: 45,
                        color: green,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      emptyState['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      emptyState['description'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusFilter extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const StatusFilter({
    super.key,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),

        selectedColor: const Color(0xFFE3F4E8),
        backgroundColor: Colors.white,

        side: BorderSide(
          color: selected
              ? const Color(0xFF21845F)
              : Colors.grey.shade300,
        ),

        labelStyle: TextStyle(
          color: selected
              ? const Color(0xFF21845F)
              : Colors.grey.shade700,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
