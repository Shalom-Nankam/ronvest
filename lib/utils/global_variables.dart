import 'package:flutter/material.dart';

import '../services/repository_provider.dart';

//All the variables being made availabe for access globally
const Color primaryColor = Color(0xff1daff2);
const Color fieldTextColor = Color(0xff2c2948);

Color fieldFillColor = const Color(0xff7fccef).withOpacity(0.15);

final repository = RepositoryProvider().provideRepository();
