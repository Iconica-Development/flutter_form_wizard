import 'package:flutter/material.dart';
import 'carousel_slider.dart';

class CarouselFormField extends FormField<int> {
  CarouselFormField({
    Key? key,
    required FormFieldSetter<int> onSaved,
    required FormFieldValidator<int> validator,
    void Function(int value)? onChanged,
    void Function(int value)? onSubmit,
    int initialValue = 0,
    bool autovalidate = false,
    required List<Widget> items,
    double height = 425,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<int> state) {
              return CarouselSlider(
                options: CarouselOptions(
                  initialPage: initialValue,
                  onPageChanged: (index, reason) {
                    onChanged?.call(index);

                    state.didChange(index);
                  },
                  height: height,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: items.map((Widget item) {
                  return item;
                }).toList(),
              );
            });
}
