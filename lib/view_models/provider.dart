import 'package:cart_riverpod/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
TextEditingController kataban(KatabanRef ref) => TextEditingController();

@riverpod
TextEditingController suryo(SuryoRef ref) => TextEditingController(text: '1');

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();
