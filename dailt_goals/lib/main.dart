import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/posts/data/repositories/goal_repository.dart';
import 'features/posts/data/services/goal_service.dart';
import 'features/presentation/bloc/goal_bloc.dart';
import 'features/presentation/bloc/goal_event.dart';
import 'features/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color emeraldGreen = Color(0xFF059669);
  static const Color backgroundColor = Color(0xFFF0FDF4);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GoalBloc(GoalRepository(GoalService()))..add(LoadGoals()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Goalify',

        theme: ThemeData(
          useMaterial3: true,

          // Main App Background
          scaffoldBackgroundColor: backgroundColor,

          colorScheme: ColorScheme.fromSeed(
            seedColor: emeraldGreen,
            primary: emeraldGreen,
          ),

          // App Bar
          appBarTheme: const AppBarTheme(
            backgroundColor: emeraldGreen,
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 2,
          ),

          // Floating Button
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: emeraldGreen,
            foregroundColor: Colors.white,
          ),

          // Buttons
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: emeraldGreen,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // Cards
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),

        home: const HomeScreen(),
      ),
    );
  }
}
