import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GithubStatsSection extends StatefulWidget {
  const GithubStatsSection({super.key});

  @override
  State<GithubStatsSection> createState() => _GithubStatsSectionState();
}

class _GithubStatsSectionState extends State<GithubStatsSection> {
  Map<String, dynamic>? _githubData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchGithubStats();
  }

  Future<void> _fetchGithubStats() async {
    try {
      final response = await http.get(Uri.parse('https://api.github.com/users/SidEnpassant'));

      if (response.statusCode == 200) {
        setState(() {
          _githubData = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load data';
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Error connecting to Github';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 0,
            vertical: isMobile ? 24 : 40,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 64,
              vertical: isMobile ? 32 : 56,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF10202B),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF3ED598).withOpacity(0.18),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3ED598).withOpacity(0.08),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF3ED598)))
                : _error != null
                    ? Center(
                        child: Text(
                          _error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.code, color: Color(0xFFC6FCA6), size: 30),
                              const SizedBox(width: 12),
                              Text(
                                "GitHub Stats",
                                style: TextStyle(
                                  fontFamily: 'Ravenna Serial ExtraBold',
                                  fontWeight: FontWeight.w900,
                                  fontSize: isMobile ? 28 : 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: isMobile ? 20 : 60,
                            runSpacing: 20,
                            children: [
                              _StatItem(
                                label: "Public Repos",
                                value: "${_githubData?['public_repos'] ?? 0}",
                                isMobile: isMobile,
                              ),
                              Container(
                                width: 1, 
                                height: 60, 
                                color: Colors.white.withOpacity(0.2),
                              ),
                              _StatItem(
                                label: "Followers",
                                value: "${_githubData?['followers'] ?? 0}",
                                isMobile: isMobile,
                              ),
                            ],
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isMobile;

  const _StatItem({
    required this.label,
    required this.value,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          value,
          style: TextStyle(
            fontFamily: 'Ravenna Serial ExtraBold',
            fontWeight: FontWeight.w900,
            fontSize: isMobile ? 36 : 56,
            color: const Color(0xFF3ED598),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
            fontSize: isMobile ? 14 : 18,
            color: Colors.white.withOpacity(0.8),
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
