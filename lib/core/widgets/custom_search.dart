import 'package:clothes_shop_app/core/widgets/image_search_view.dart';
import 'package:clothes_shop_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import '../utils/styles.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;

  final Function(String)? onChanged;

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            cursorColor: kGreyColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              filled: true,
              fillColor: kWhiteColor,
              hintText: 'What are you looking for ?',
              hintStyle: Styles.buttonBold.copyWith(color: kGreyColor),
              prefixIcon: SvgPicture.asset(
                Assets.imagesSearchIcon,
                fit: BoxFit.scaleDown,
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ImageSearchView(),
                        ),
                      );
                      if (result != null) {
                        widget.controller?.text = result;
                        widget.onChanged?.call(result);
                      }
                    },
                    icon: Icon(Icons.image, color: Colors.grey),
                  ),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
