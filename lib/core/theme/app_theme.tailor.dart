// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeTailorMixin on ThemeExtension<AppTheme> {
  Color get background;
  Color get appBarBackground;
  TextStyle get heading1;
  TextStyle get title1;
  TextStyle get title2;
  TextStyle get subtitle1;
  TextStyle get subtitle2;
  TextStyle get body1;
  TextStyle get caption;
  AppPalette get palette;

  @override
  AppTheme copyWith({
    Color? background,
    Color? appBarBackground,
    TextStyle? heading1,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? body1,
    TextStyle? caption,
    AppPalette? palette,
  }) {
    return AppTheme(
      background: background ?? this.background,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      heading1: heading1 ?? this.heading1,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      body1: body1 ?? this.body1,
      caption: caption ?? this.caption,
      palette: palette ?? this.palette,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      background: Color.lerp(background, other.background, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      heading1: TextStyle.lerp(heading1, other.heading1, t)!,
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      palette: t < 0.5 ? palette : other.palette,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality().equals(
              background,
              other.background,
            ) &&
            const DeepCollectionEquality().equals(
              appBarBackground,
              other.appBarBackground,
            ) &&
            const DeepCollectionEquality().equals(heading1, other.heading1) &&
            const DeepCollectionEquality().equals(title1, other.title1) &&
            const DeepCollectionEquality().equals(title2, other.title2) &&
            const DeepCollectionEquality().equals(subtitle1, other.subtitle1) &&
            const DeepCollectionEquality().equals(subtitle2, other.subtitle2) &&
            const DeepCollectionEquality().equals(body1, other.body1) &&
            const DeepCollectionEquality().equals(caption, other.caption) &&
            const DeepCollectionEquality().equals(palette, other.palette));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(appBarBackground),
      const DeepCollectionEquality().hash(heading1),
      const DeepCollectionEquality().hash(title1),
      const DeepCollectionEquality().hash(title2),
      const DeepCollectionEquality().hash(subtitle1),
      const DeepCollectionEquality().hash(subtitle2),
      const DeepCollectionEquality().hash(body1),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(palette),
    );
  }
}

extension AppThemeBuildContext on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
