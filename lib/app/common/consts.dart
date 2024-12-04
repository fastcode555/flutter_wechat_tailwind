import 'dart:math';

/// Barry
/// @date 2024/12/4
/// describe:
class Consts {
  static final Random _random = Random();
  static final images = [
    'https://picsum.photos/800/400',
    'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/feb50c8a-ba08-43a8-2a8c-67fc492b5400/width=450/178486.jpeg',
    'https://gd-hbimg.huaban.com/1375eefcaf4009488ee44604d0a2c708f826b5aa217bc-fRLIAN',
    'https://cdn.wujiebantu.com/ai/0A66935C34BEA73339FC2820FE79F73F-01.jpg',
    'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/76c10788-7b9d-42fe-bd7b-3fabacb7a0d4/width=450/00157-2671606984.jpeg',
    'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/001d84f5-4531-4270-f370-dde5384a1200/width=450/00123-3266348108.jpeg',
    'https://cdn.wujiebantu.com/thumbnail/FmNBew8psdpjecPF7rLTtZVFxBmR.jpg',
    'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/b2178483-35eb-4391-67a5-f7c9594ca700/width=450/00011-2269534988.jpeg',
    'https://cdn.wujiebantu.com/ai/FAD12EF0EE8805DBE2353BDF8BC511A7-01.jpg?imageView2/2/w/800/q/75/format/webp',
    'https://cdn.wujiebantu.com/ai/8270F3B9C0987F123B363D3220BB9753-01.jpg',
    'https://cdn.wujiebantu.com/ai/16801403093D5ED3BF7AEF8F7886F42A-01.jpg?imageView2/2/w/800/q/75/format/webp',
    'https://cdn.wujiebantu.com/ai/817EFC3C038015F48D13EFB36E7F3005-01.jpg?imageView2/2/w/800/q/75/format/webp',
    'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/46598e36-dc62-49a1-8a9e-c69af5c36d00/width=450/00054-1848569751.jpeg',
    'https://gd-hbimg.huaban.com/526c692a5316d13978e57314029d7fcb81329bc113c768-TglkoB'
  ];

  Consts._();

  static const userAvatar = 'https://gd-hbimg.huaban.com/4d5082af14289fb2780b7286541c61641e234cf3281ab-bv2KgH';
  static const avatar =
      'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/f8d92a94-7277-4de9-7c19-37fa54064f00/width=450/00006-876757646645.jpeg';

  static String get randomImage => images[_random.nextInt(images.length - 1)];
}
