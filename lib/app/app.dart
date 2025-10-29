    import 'package:flutter/material.dart';
    import 'package:fokus/app/shared/enums/timer_type.dart';
    import 'package:fokus/app/view/pages/home_page.dart';
    import 'package:fokus/app/view/pages/timer_page.dart';
    import 'package:fokus/app/view_model/timer_view_model.dart';
    import 'package:google_fonts/google_fonts.dart';
    import 'package:provider/provider.dart';

    class App extends StatelessWidget {
      const App({super.key});

      @override
      Widget build(BuildContext context) {
        return ChangeNotifierProvider( create: (_)=> TimerViewModel(),
          child: MaterialApp(
            routes: {
              "/home": (context) => HomePage(),
              "/timer": (context) => TimerPage(
                timerType:
                    (ModalRoute.of(context)!.settings.arguments as TimerType?) ??
                    TimerType.focus,
              ),
            },
            title: 'Fokus',
            theme: ThemeData(
              useMaterial3: true,
              textTheme: GoogleFonts.unboundedTextTheme(),
            ),
            initialRoute: "/home",
          ),
        );
      }
    }
