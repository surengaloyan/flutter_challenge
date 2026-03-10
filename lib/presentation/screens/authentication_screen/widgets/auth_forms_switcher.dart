import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/theme.dart';

class AuthFormsSwitcher extends StatelessWidget {
  const AuthFormsSwitcher({
    super.key,
    required this.isLogin,
    required this.onSwitch,
  });

  final bool isLogin;
  final void Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ChallengeColorTheme.of(context);
    final textTheme = ChallengeTextTheme.of(context);

    return LayoutBuilder(
      builder: (context, constrains) {
        return Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colorTheme.backgroundSecondary,
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: isLogin
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: constrains.maxWidth / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorTheme.primary,
                  ),
                ),
              ),
              SizedBox.expand(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onSwitch(true),
                        child: Text(
                          'Login',
                          style: textTheme.buttonMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onSwitch(false),
                        child: Text(
                          'Sign-up',
                          style: textTheme.buttonMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
