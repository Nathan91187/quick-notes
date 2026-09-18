import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_notes/providers/note_provider.dart';
import 'package:quick_notes/screens/note_list.dart';


void main() => runApp(
  MaterialApp(
    home: MyApp(),
  )
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> NoteProvider()),
      ],
      child: MaterialApp(
        title: "Quick Notes",
        home: NoteList(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF172554),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF3B82F6)).copyWith(
            primary: const Color(0xFF3B82F6),
            secondary: const Color(0xFF374151),
            error: const Color(0xFFEF4444),
          ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color(0xFFF8FAFC)),
              bodyMedium: TextStyle(color: Color(0xFFCBD5E1)),
              bodySmall: TextStyle(color: Color(0xFF94A3B8)),
            ),
            appBarTheme: const AppBarThemeData(
                backgroundColor: Color(0xFF1F2937),
                titleTextStyle: TextStyle(
                    color: Color(0xFFF8FAFC),
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              iconTheme: IconThemeData(
                color: Color(0xFFF8FAFC)
              )
            ),
            cardTheme: CardThemeData(
              color: const Color(0xFF374151),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )
        ),
      ),
    );
  }
}
