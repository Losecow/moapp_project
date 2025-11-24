import 'package:flutter/material.dart';

// 클래스 이름을 InfoPage2로 변경
class InfoPage2 extends StatelessWidget {
  const InfoPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경 그라데이션 적용
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFB6E1), Color(0xFFC9A9FF)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 상단 뒤로가기 버튼
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 20),

                // 프로필 정보 설정 타이틀
                const Text(
                  '프로필 정보 설정',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Bagel Fat One',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '자신을 가장 잘 나타내는 키워드를 선택해주세요',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),

                // 키워드 선택 영역
                _buildKeywordSection(
                  title: '어떤 스타일의 옷을 즐겨 입나요?',
                  keywords: ['깔끔한', '힙한', '캐주얼', '스트릿'],
                ),
                const SizedBox(height: 30),
                _buildKeywordSection(
                  title: '어떤 성격에 가까운가요?',
                  keywords: ['활발한', '차분한', '엉뚱한', '진지한'],
                ),
                const SizedBox(height: 50),

                // 완료 버튼
                ElevatedButton(
                  onPressed: () {
                    print("완료 버튼 클릭!");
                    // 여기서 최종 완료 로직을 처리합니다.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFE94B9A),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    '완료',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Bagel Fat One',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 키워드 섹션을 만드는 위젯
  Widget _buildKeywordSection({required String title, required List<String> keywords}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Wrap 위젯으로 키워드를 화면 너비에 맞게 자동 줄바꿈
        Wrap(
          spacing: 10.0, // 가로 간격
          runSpacing: 10.0, // 세로 간격
          children: keywords.map((keyword) {
            return Chip(
              label: Text(keyword),
              backgroundColor: Colors.white.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            );
          }).toList(),
        ),
      ],
    );
  }
}