import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:islamic_app/core/assets_manager.dart";
import "package:islamic_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart";
import "package:islamic_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart";
import "package:islamic_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart";
import "package:islamic_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart";
import "package:islamic_app/presentation/screens/home/tabs/tasbeh_tab/tasbeh_tab.dart";
import "package:islamic_app/providers/theme_provider.dart";
import "package:provider/provider.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    const TasbehTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                myProvider.isLightTheme()
                    ? AssetsManager.mainBgLight
                    : AssetsManager.mainBgDark,
              ))),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  // 1
                  selectedIndex = index; // 1
                  setState(() {});
                },
                type: BottomNavigationBarType.shifting,
                items: [
                  BottomNavigationBarItem(
                      icon:
                          const ImageIcon(AssetImage(AssetsManager.quranIcon)),
                      label: AppLocalizations.of(context)!.quranTab),
                  BottomNavigationBarItem(
                      icon:
                          const ImageIcon(AssetImage(AssetsManager.hadithIcon)),
                      label: AppLocalizations.of(context)!.hadithHeader),
                  BottomNavigationBarItem(
                      icon:
                          const ImageIcon(AssetImage(AssetsManager.tasbehIcon)),
                      label: AppLocalizations.of(context)!.sebhaTab),
                  BottomNavigationBarItem(
                      icon:
                          const ImageIcon(AssetImage(AssetsManager.radioIcon)),
                      label: AppLocalizations.of(context)!.radioTab),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settingsTab)
                ]),
          ),
          body: tabs[selectedIndex]),
    );
  }
}
