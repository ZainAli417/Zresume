import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zresume/apis/auth.dart';
import 'package:zresume/apis/resume.dart';
import 'package:zresume/global/models/pdf_model.dart';

final resumeController = StateNotifierProvider.family<UserResumeList, AsyncValue<List<PdfModel>>, String>((ref, uid) {
  return UserResumeList(ref, uid);
});

class UserResumeList extends StateNotifier<AsyncValue<List<PdfModel>>> {
  final String uid;
  final Ref ref;

  UserResumeList(this.ref, this.uid) : super(const AsyncLoading()) {
    _getResume();
  }

  Future<void> _getResume() async {
    try {
      final List<PdfModel> pdfModels = await PdfModelApi(uid, ref.read(firebaseFirestoreProvider)).retrievePdfModel();
      state = AsyncData(pdfModels);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<bool> addToResume({required PdfModel pdfModel}) async {
    try {
      await PdfModelApi(uid, ref.read(firebaseFirestoreProvider)).setPdfModel(pdfModel.pdfId, pdfModel);
      final List<PdfModel> pdfModels = await PdfModelApi(uid, ref.read(firebaseFirestoreProvider)).retrievePdfModel();
      state = AsyncData(pdfModels);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> deleteFromResume({required PdfModel pdfModel}) async {
    try {
      await PdfModelApi(uid, ref.read(firebaseFirestoreProvider)).deletePdfModel(pdfModel.pdfId);
      final List<PdfModel> pdfModels = await PdfModelApi(uid, ref.read(firebaseFirestoreProvider)).retrievePdfModel();
      state = AsyncData(pdfModels);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
