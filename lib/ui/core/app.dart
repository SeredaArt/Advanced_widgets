import 'package:advanced_widgets/ui/theme/app_theme.dart';
import 'package:advanced_widgets/ui/widgets/wheather_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/app_state.dart';
import '../theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appStateProvider.select((model) => model.theme));

    return AppThemeProvider(
      theme: theme,
      child: Builder(
        builder: (innerContext) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              scaffoldBackgroundColor: AppTheme.light().colors.background,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: AppTheme.dark().colors.background,
            ),
            themeMode: theme.themeMode,
            home: const Material(
              child: MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppThemeProvider.of(context).theme;
    var currentSliderValue =
        ref.watch(appStateProvider.select((model) => model.currentSliderValue));
    var scaleWeather =
        ref.watch(appStateProvider.select((model) => model.scaleWeather));
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: ref.read(appStateProvider.notifier).toogleTheme,
              icon: theme.themeMode == ThemeMode.dark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            // Container(
            //     alignment: Alignment.center,
            //     child: Padding(
            //         padding: EdgeInsets.only(top: 100),
            //         child: Transform.scale(
            //             scale: 3,
            //             child: SizedBox(
            //                 height: 150,
            //                 width: 150,
            //                 child: CustomPaint(
            //                     painter: WeatherIndicator(
            //                         value: currentSliderValue,
            //                        themeColors: theme.colors)))))),
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedScale(
                  scale: scaleWeather,
                  duration: const Duration(seconds: 1),
                  child: GestureDetector(onTap: ref.read(appStateProvider.notifier).changeScale,
                    child: SizedBox(
                        height: 150,
                        width: 150,
                        child: CustomPaint(
                            painter: WeatherIndicator(
                                value: currentSliderValue,
                                themeColors: theme.colors))),
                  )),
            ),
            Slider(
              activeColor: theme.colors.slider,
              thumbColor: theme.colors.textFieldColor,
              value: currentSliderValue,
              max: 1,
              divisions: 10,
              label: currentSliderValue.toString(),
              onChanged: (value) {
                ref.read(appStateProvider.notifier).setValue(value);
              },
            ),
          ],
        )));
  }
}
