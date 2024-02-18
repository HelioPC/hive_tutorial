import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  AddTripScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: 'City 1');
  final _descriptionController = TextEditingController(text: 'Best city ever');
  final _locationController = TextEditingController(text: 'Paris');
  final _imageController = TextEditingController(text: 'https://media.iatiseguros.com/wp-content/uploads/sites/6/2018/12/01065501/torre-eiffel-paris.jpg');
  final List<String> images = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: _imageController,
            decoration: const InputDecoration(labelText: 'Image'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                images.add(_imageController.text);

                final newTrip = Trip(
                  id: Random().nextDouble().toString(),
                  title: _titleController.text,
                  images: images,
                  description: _descriptionController.text,
                  date: DateTime.now(),
                  location: _locationController.text,
                );

                ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
              }
            },
            child: const Text('Add trip'),
          ),
        ],
      ),
    );
  }
}
