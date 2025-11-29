import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Firestore에 사용자 정보를 저장하는 서비스
///
/// 컬렉션 구조:
/// users/{uid} 문서에 프로필 정보를 저장한다.
class FirestoreService {
  FirestoreService();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 현재 로그인한 사용자의 uid
  String? get _userId => _auth.currentUser?.uid;

  /// 현재 사용자 문서 참조
  DocumentReference<Map<String, dynamic>> get _userDoc {
    final uid = _userId;
    if (uid == null) {
      throw Exception('로그인한 사용자가 없습니다. FirebaseAuth.currentUser가 null 입니다.');
    }
    return _db.collection('users').doc(uid);
  }

  /// 학교 / 전공 정보 저장 (업서트)
  Future<void> upsertSchoolInfo({
    required String school,
    required String major,
  }) async {
    print('🔥 FirestoreService.upsertSchoolInfo 호출됨');
    print('   - school: $school');
    print('   - major: $major');
    
    final uid = _userId;
    print('   - currentUser.uid: $uid');
    
    if (uid == null) {
      print('❌ currentUser가 null입니다!');
      throw Exception('로그인한 사용자가 없습니다. FirebaseAuth.currentUser가 null 입니다.');
    }
    
    try {
      print('💾 Firestore에 저장 시도 중...');
      await _userDoc.set(
        {
          'school': school,
          'major': major,
          'updatedAt': FieldValue.serverTimestamp(),
          'createdAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
      print('✅ Firestore 저장 완료!');
    } catch (e, stackTrace) {
      print('❌ Firestore 저장 실패: $e');
      print('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// 프로필 키워드 정보 저장 (업서트)
  Future<void> upsertProfileKeywords({
    required List<String> styleKeywords,
    required List<String> personalityKeywords,
  }) async {
    await _userDoc.set(
      {
        'styleKeywords': styleKeywords,
        'personalityKeywords': personalityKeywords,
        'updatedAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    );
  }

  /// 프로필 정보 저장 (업서트) - 이름, 나이, 자기소개, 외모 스타일
  Future<void> upsertProfileInfo({
    required String name,
    required int age,
    required String bio,
    required List<String> appearanceStyles,
  }) async {
    print('🔥 FirestoreService.upsertProfileInfo 호출됨');
    print('   - name: $name');
    print('   - age: $age');
    print('   - bio: $bio');
    print('   - appearanceStyles: $appearanceStyles');

    final uid = _userId;
    print('   - currentUser.uid: $uid');

    if (uid == null) {
      print('❌ currentUser가 null입니다!');
      throw Exception('로그인한 사용자가 없습니다. FirebaseAuth.currentUser가 null 입니다.');
    }

    try {
      print('💾 Firestore에 프로필 정보 저장 시도 중...');
      await _userDoc.set(
        {
          'name': name,
          'age': age,
          'bio': bio,
          'appearanceStyles': appearanceStyles,
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
      print('✅ 프로필 정보 저장 완료!');
    } catch (e, stackTrace) {
      print('❌ 프로필 정보 저장 실패: $e');
      print('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// 선호 스타일 정보 저장 (업서트) - 선호하는 외모, 성격, 취미
  Future<void> upsertPreferenceStyles({
    required List<String> preferredAppearanceStyles,
    required List<String> preferredPersonalities,
    required List<String> preferredHobbies,
  }) async {
    print('🔥 FirestoreService.upsertPreferenceStyles 호출됨');
    print('   - preferredAppearanceStyles: $preferredAppearanceStyles');
    print('   - preferredPersonalities: $preferredPersonalities');
    print('   - preferredHobbies: $preferredHobbies');

    final uid = _userId;
    print('   - currentUser.uid: $uid');

    if (uid == null) {
      print('❌ currentUser가 null입니다!');
      throw Exception('로그인한 사용자가 없습니다. FirebaseAuth.currentUser가 null 입니다.');
    }

    try {
      print('💾 Firestore에 선호 스타일 저장 시도 중...');
      await _userDoc.set(
        {
          'preferredAppearanceStyles': preferredAppearanceStyles,
          'preferredPersonalities': preferredPersonalities,
          'preferredHobbies': preferredHobbies,
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
      print('✅ 선호 스타일 저장 완료!');
    } catch (e, stackTrace) {
      print('❌ 선호 스타일 저장 실패: $e');
      print('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }
}


