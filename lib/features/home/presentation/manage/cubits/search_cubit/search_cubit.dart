import 'dart:typed_data';
import 'package:clothes_shop_app/core/services/clothes_classification/clothes_prediction.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final ImagePicker _picker = ImagePicker();
  final ClothesPrediction _clothesPrediction = ClothesPrediction();

  Future<void> pickImageAndPredict(ImageSource source) async {
    emit(SearchLoading());

    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) {
        emit(const SearchError('No image selected.'));
        return;
      }

      final Uint8List imageBytes = await pickedFile.readAsBytes();

      await _clothesPrediction.predictImageType(imageBytes);
      final result = _clothesPrediction.predictionResult;

      emit(
        SearchImageSuccess(
          image: imageBytes,
          prediction: result ?? "no prediction set",
        ),
      );
    } catch (e) {
      emit(SearchError('Prediction failed: $e'));
    }
  }
}
