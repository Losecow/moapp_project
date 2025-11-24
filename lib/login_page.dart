import 'package:flutter/material.dart';
import 'info_page.dart'; // 1. 새로 만든 페이지 import

class ResponsiveLoginPage extends StatelessWidget {
  const ResponsiveLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDECF4),
              Color(0xFFF8D6E9),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: screenSize.height * 0.12,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB6E1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.26,
                  child: const Text(
                    '캠퍼스 매치',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5B3F5B),
                      fontSize: 32,
                      fontFamily: 'Bagel Fat One',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.35,
                  // 2. context를 _buildLoginFormCard에 전달
                  child: _buildLoginFormCard(context, screenSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 3. context를 매개변수로 받도록 수정
  Widget _buildLoginFormCard(BuildContext context, Size screenSize) {
    return Container(
      width: screenSize.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              color: Color(0xFFE94B9A),
              fontSize: 30,
              fontFamily: 'Bagel Fat One',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'login ha sem mosol dlc a.',
            style: TextStyle(
              color: const Color(0xFFE94B9A).withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          _buildTextField(label: 'ID', hint: 'ID를 입력하세요'),
          const SizedBox(height: 20),
          // obscureText: true 추가
          _buildTextField(label: 'PW', hint: 'PW를 입력하세요', obscureText: true),
          const SizedBox(height: 30),
          // 4. context를 _buildLoginButton에 전달
          _buildLoginButton(context),
          const SizedBox(height: 20),
          _buildSocialButton(text: 'Google 로 시작하기'),
          const SizedBox(height: 10),
          _buildSocialButton(text: '카카오로 시작하기'),
        ],
      ),
    );
  }

  // obscureText 파라미터 추가
  Widget _buildTextField({required String label, required String hint, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFC48EC4),
            fontSize: 16,
            fontFamily: 'Bagel Fat One',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText, // 비밀번호 필드를 위해 추가
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFFFDF6FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  // 5. context를 매개변수로 받도록 수정
  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFD6A4E0),
            Color(0xFFC0A0E0),
          ],
        ),
      ),
      child: ElevatedButton(
        // 6. onPressed 이벤트에 페이지 이동 코드 추가
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InfoPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Bagel Fat One',
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required String text}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}