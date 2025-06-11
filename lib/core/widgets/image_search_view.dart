import 'dart:typed_data';

import 'package:clothes_shop_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/home/presentation/manage/cubits/search_cubit/search_cubit.dart';

class ImageSearchView extends StatelessWidget {
  const ImageSearchView({super.key});

  void _pickImage(BuildContext context, ImageSource source) {
    context.read<SearchCubit>().pickImageAndPredict(source);
  }

  void _returnPrediction(BuildContext context, String prediction) {
    Navigator.pop(context, prediction);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('Search by Image'),
          actions: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchImageSuccess) {
                  return IconButton(
                    icon: const Icon(Icons.check),
                    tooltip: "Use this result",
                    onPressed:
                        () => _returnPrediction(context, state.prediction),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              Uint8List? image;
              String? prediction;
              String? error;

              if (state is SearchImageSuccess) {
                image = state.image;
                prediction = state.prediction;
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.memory(image, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "Prediction: $prediction",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    ImagePickerButtons(
                      onPick: (source) => _pickImage(context, source),
                    ),
                  ],
                );
              } else if (state is SearchLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(color: Colors.black),
                      const SizedBox(height: 8),
                      const Text("Analyzing image..."),
                    ],
                  ),
                );
              } else if (state is SearchError) {
                error = state.message;
                return Column(
                  children: [
                    const Spacer(),
                    Image.asset("assets/images/pick_image_field.png"),
                    Text(error, style: const TextStyle(color: Colors.red)),
                    const Spacer(),
                    ImagePickerButtons(
                      onPick: (source) => _pickImage(context, source),
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset("assets/images/search_image.png"),
                    Text("Search for similar items using an image"),

                    const Spacer(),
                    ImagePickerButtons(
                      onPick: (source) => _pickImage(context, source),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ImagePickerButtons extends StatelessWidget {
  final void Function(ImageSource source) onPick;

  const ImagePickerButtons({super.key, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.photo),
          label: const Text("Gallery"),
          onPressed: () => onPick(ImageSource.gallery),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          icon: SvgPicture.asset(Assets.imagesCameraIcon, height: 24),
          label: const Text("Camera"),
          onPressed: () => onPick(ImageSource.camera),
        ),
      ],
    );
  }
}
