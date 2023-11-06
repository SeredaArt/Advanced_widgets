import 'package:advanced_widgets/ui/theme/app_theme.dart';
import 'package:advanced_widgets/ui/theme/text_decoration.dart';
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
    var selected =
        ref.watch(appStateProvider.select((model) => model.selected));
    var opacityLevel =
    ref.read(appStateProvider.select((model) => model.opacityLevel));

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
            Stack(children: [
              AnimatedScale(
                  alignment: Alignment.topRight,
                  scale: scaleWeather,
                  duration: const Duration(seconds: 1),
                  child: GestureDetector(
                      onTap: () {
                        ref.read(appStateProvider.notifier).changeScale(
                            MediaQuery.of(context).size.height /
                                MediaQuery.of(context).size.width);
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: SizedBox.square(
                            dimension: 150,
                            child: CustomPaint(
                                painter: WeatherIndicator(
                                    value: currentSliderValue,
                                    themeColors: theme.colors))),
                      ))),
              if (selected)
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.288 + 40,
                        left: MediaQuery.of(context).size.width * 0.365),
                    child: AnimatedOpacity(alwaysIncludeSemantics: true,
                      curve: Curves.easeIn,
                      key: key,
                      opacity: opacityLevel,
                      duration: const Duration(seconds: 1),
                      child: InnerShadow(
                          child: Text(
                        'Облачно,\n12 градусов',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.start,
                      )),
                    )),
            ]),


          ],
        )));
  }
}
