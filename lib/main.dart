import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KurdistanIptvApp());
}

const String kAppLogoUrl =
    'https://cdn.phototourl.com/member/2026-10-29-87d55c9b-16cb-4d86-989f-d149f705de90.png';
const String kWebsiteUrl = 'http://kurdistaniptv.netlify.app';
const String kSupportEmail = 'qsnoramedi5@gmail.com';
const String kAvaTvStreamUrl =
    'https://hlspackager.akamaized.net/live/DB/AVA_TV/HLS/AVA_TV.m3u8';

const Map<String, String> kChannelLogos = {
  'rudaw tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-3f58865e-92fb-436c-82ec-9817c62edb1c.jpg',
  'ava tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-b8b3e91c-6e1c-45c9-9414-a461a0a0d768.png',
  'kurdistan24 tv hd': 'https://i.imgur.com/tfutGXs.jpeg',
  'speda tv hd': 'https://i.imgur.com/iLegreI.jpeg',
  'gali krd': 'https://i.imgur.com/tfutGXs.jpeg',
  'kurdsat news':
      'https://cdn.phototourl.com/member/2026-10-27-7fdb1f79-80ab-4b82-96d6-620c0775a163.jpg',
  'nuçê tv hd': 'https://i.imgur.com/bAbGwz4.jpeg',
  'nrt tv hd': 'https://i.imgur.com/kWl12aS.jpeg',
  'channel 8': 'https://i.imgur.com/KctCA5h.jpeg',
  'mmn news tv hd': 'https://i.imgur.com/4rMQG2L.jpeg',
  'afarin tv': 'https://i.imgur.com/JokOZMA.jpeg',
  'kurdistan tv hd': 'https://i.imgur.com/KdWfE7t.jpeg',
  'shar tv hd': 'https://i.imgur.com/b5EAM9S.jpeg',
  'avar tv hd': 'https://i.imgur.com/NQJkswF.jpeg',
  'kurdsat tv hd': 'https://i.imgur.com/y3PaDFV.jpeg',
  'welat tv hd': 'https://i.imgur.com/rtESbZX.jpeg',
  'bask tv hd': 'https://i.imgur.com/wYlkkEb.jpeg',
  'euro kurd tv':
      'https://cdn.phototourl.com/member/2026-10-27-3d7ee5c8-f97d-4a28-a03a-011fe96fd03a.jpg',
  'gk+ tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-5d982db3-5042-412f-87eb-0814515921fd.jpg',
  'peshang tv hd': 'https://i.imgur.com/pJfjM7B.jpeg',
  'red tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-09cf66f8-e468-4052-bf8f-e6ac484aa400.jpg',
  'kurd 7 tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-5d3e27ca-8be0-44d6-ad7e-97a326233b37.jpg',
  'homzhyar tv hd':
      'https://yt3.googleusercontent.com/Hge9Iuu9wtGq63Rvd4C5S21jUdCXBxBRupMQgpOyaWSNDHB5C-GuSrGnTKtuHI4E92Xht-laSQ=s160-c-k-c0x00ffffff-no-rj',
  'gewher tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-58343dd9-1799-4d46-a1dd-d081eaff7833.jpg',
  'waar tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-6ffc56af-911a-47e0-b4c1-adece02d5a91.jpg',
  'ava family tv':
      'https://cdn.phototourl.com/member/2026-10-27-c14fb856-f5d8-44e4-abc3-5eacfbd94e5e.jpg',
  'khak tv hd': 'https://i.imgur.com/wqc0Sa2.jpeg',
  'payam tv hd': 'https://i.imgur.com/sG5YFCn.jpeg',
  '4kurd tv hd':
      'https://cdn.phototourl.com/member/2026-10-27-edcf59aa-ffa2-4415-a2f6-f8a8a687924d.jpg',
  'cira tv hd':
      'https://cdn.phototourl.com/member/2026-10-29-a6486666-1206-47a9-83c7-e703fd9d44bb.jpg',
  'jin tv hd': 'https://i.imgur.com/0FOGoXB.jpeg',
  'kurd channel':
      'https://yt3.googleusercontent.com/RihQd8lOLF5H8i-PhAK1tfij3RUEdANdFYIEWl5iM_W3qGMpVs1WDfs3f_G_yW-XPHie9YFj5g=s900-c-k-c0x00ffffff-no-rj',
  'mmn documentary': 'https://karwan.tv/wp-content/uploads/mmn-tv-528x297.png',
  'shna tv hd': 'https://karwan.tv/wp-content/uploads/shna-tv-1.jpg',
  'mix kurdi tv':
      'https://blogger.googleusercontent.com/img/a/AVvXsEgkepCXmjyUwOGUsbSXi52Qft774FFXw9MzNunPQyqxGsqxHTWycALQ046cZIMMkaBuKCPZK_6EsHVmhAhblG5r48k_3w4I58-89Ef4tfbD6_dOaelmnT6sCyYJW-gwoASB03U25xhuEe09uJaDm4a91FHCU4HD0t2NAhXmGL4wxF7HR_WK6oNuNYZAce-C=s205',
  'naqshi media': 'https://karwan.tv/wp-content/uploads/naqshi-media-1.jpg',
  'rehber tv':
      'https://cdn.phototourl.com/member/2026-11-05-f8511e80-932b-4b22-93e7-fe98a0f3d709.jpg',
  'soran tv':
      'https://cdn.phototourl.com/member/2026-11-05-60c19931-f12a-4f7b-be63-64a952e5d2a4.jpg',
  'sada tv hd': 'https://karwan.tv/wp-content/uploads/sada-tv-528x297.jpg',
  'barin movies': 'https://karwan.tv/wp-content/uploads/barin-movies-1.png',
  'barin family': 'https://karwan.tv/wp-content/uploads/barin-family-1.png',
  'bnar family': 'https://karwan.tv/wp-content/uploads/bnar-tv-528x297.png',
  'bnar movies': 'https://karwan.tv/wp-content/uploads/bnar-movies-1.png',
  'bnar action': 'https://karwan.tv/wp-content/uploads/bnar-action-1.jpg',
  'zhin tv film':
      'https://cdn.phototourl.com/member/2026-11-05-b708c064-005d-4f77-95eb-174abd374b64.jpg',
  'mmn art': 'https://karwan.tv/wp-content/uploads/mmn-tv-528x297.png',
  'mmn action': 'https://karwan.tv/wp-content/uploads/mmn-tv-528x297.png',
  'speda drama':
      'https://cdn.phototourl.com/member/2026-11-05-2a6b58f2-6cb5-49e6-aaef-40b27b4f143c.png',
  'zarok kurmanji':
      'https://cdn.phototourl.com/member/2026-11-05-49b27a4e-f067-4069-b5bd-091641df8123.jpg',
  'zarok':
      'https://cdn.phototourl.com/member/2026-11-05-49b27a4e-f067-4069-b5bd-091641df8123.jpg',
  'gewher kids':
      'https://cdn.phototourl.com/member/2026-11-05-34d630f3-9fbf-4445-b4a3-8e1ae9ccbcd5.jpg',
  'kidco':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnl0kTpRXq-bNthc_HKrIuZuEyCngHjL4XWd9zaovSSQ&s=10',
  'zoomoo':
      'https://cdn.phototourl.com/member/2026-11-05-7dfd7f51-1c1e-4602-9f95-12568975f228.png',
  'toom and jerry':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQkfv5IRnL0jdjHXr9kx7EIvEKiE90kNCQl78UegCY6g&s=10',
  'ryan and freinds':
      'https://cdn.phototourl.com/member/2026-11-05-9f1bb33d-e7c4-41f3-97a4-6fa69d6ca764.jpg',
  'abc kids':
      'https://cdn.phototourl.com/member/2026-11-05-796ccb1e-999d-4a7a-9752-68243160a1ef.jpg',
  'baby shark':
      'https://cdn.phototourl.com/member/2026-11-05-b6d15628-ac33-42e5-b4fa-c021833b74e3.jpg',
  'maraya kids':
      'https://cdn.phototourl.com/member/2026-11-05-f4acbc87-c815-4c2c-8d92-3d4ad7d6c4d0.jpg',
  'bangawaz tv hd':
      'https://cdn.phototourl.com/member/2026-11-05-152c8381-8ca3-48ff-9381-d8ff38faa833.jpg',
  'amojgari':
      'https://cdn.phototourl.com/member/2026-11-05-4e5947fd-5649-4f2e-9936-9f60c17596d8.png',
  'academy amojgari':
      'https://cdn.phototourl.com/member/2026-11-05-28629552-debb-4813-9b93-548053f4878e.png',
  'eman tv hd': 'https://karwan.tv/wp-content/uploads/eman-tv-1.jpg',
  'farmooda tv': 'https://i.imgur.com/x4KCQlH.png',
  'walla quran':
      'https://cdn.phototourl.com/member/2026-11-06-65a2dabc-da6d-4125-bbe6-f34ae46d246a.jpg',
  'imk tv hd': 'https://imkmedia.tv/wp-content/themes/imk-tv/assets/images/logo.png',
  'imk quran tv':
      'https://imkmedia.tv/wp-content/themes/imk-tv/assets/images/logo.png',
  'spi tv quran': 'https://karwan.tv/wp-content/uploads/spi-quran-1.png',
  'mmn quran': 'https://karwan.tv/wp-content/uploads/mmn-tv-528x297.png',
  'ashti quran':
      'https://cdn.phototourl.com/member/2026-11-06-8771b619-76c8-42c9-b8de-ee7188ee7c48.png',
  'mihrab tv hd':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bpsue_qjtXL-naiVFPTmOkdMwClNaJGCM3a_J30S3g&s=10',
  'mihrab fm hd':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bpsue_qjtXL-naiVFPTmOkdMwClNaJGCM3a_J30S3g&s=10',
  'soz tv quran': 'https://karwan.tv/wp-content/uploads/soz-tv-528x297.jpg',
  'soz tv': 'https://karwan.tv/wp-content/uploads/soz-tv-528x297.jpg',
  'rawshan':
      'https://cdn.phototourl.com/member/2026-11-06-282603f1-3f02-4fb4-9710-ec250ce42eaa.webp',
  'saudi quran':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJP12RJbR1yuwLrytjQy_YlQnV-hEpjbNINjvYClyfFw&s=10',
  'saudi sunnah':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQekbxWPN9RzGXaUAo3CgSYwvor3-qjrbOgxVTwK51fGg&s=10',
  'makka tv live':
      'https://cdn.phototourl.com/member/2026-11-06-88e82c36-e264-4a0a-8a2a-5dc4f5ff1207.png',
  'ksa quran radio':
      'https://cdn.phototourl.com/member/2026-11-06-cdd9c962-bd4a-4ae8-a3fc-cced87457b41.jpg',
  'gewher sport': 'https://karwan.tv/wp-content/uploads/gewher-sport.jpeg',
  'mmn sport': 'https://karwan.tv/wp-content/uploads/mmn-tv-528x297.png',
  'qatar tv':
      'https://cdn.phototourl.com/member/2026-11-06-d3de4c86-f28a-4d85-85ea-58bc815eecd3.jpg',
  'qatar tv 2':
      'https://cdn.phototourl.com/member/2026-11-06-05e2944b-c8ea-483b-a22d-24c382057538.jpg',
  'watan tv hd':
      'https://cdn.phototourl.com/member/2026-11-06-6e94822c-dfab-4e42-b893-b67057d3a745.jpg',
  'zagros tv': 'https://zagros24.net/wp-content/uploads/2026/02/222-scaled.png',
  'alghad':
      'https://cdn.phototourl.com/member/2026-11-06-f6b723f3-8a8d-4aed-a3a5-73cc887e1da5.jpg',
  'al arabia news':
      'https://cdn.phototourl.com/member/2026-11-06-cd1ea7d2-eb47-4af4-99c2-81d55af751be.jpg',
  'perwerdayi slemani': 'https://karwan.tv/wp-content/uploads/parwarday-tv.jpg',
  'perwerdayi duhok': 'https://karwan.tv/wp-content/uploads/parwarday-tv.jpg',
  'perwerdayi hewler': 'https://karwan.tv/wp-content/uploads/parwarday-tv.jpg',
  'bbc earth': 'https://i.imgur.com/nGSsUd4.png',
  'spacetoon':
      'https://framerusercontent.com/images/PjVx8jeG3RzqWp9Now3SePCk5Q.png?scale-down-to=512&width=1437&height=984',
  'trt 1':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzS4D7_FqaPU503vZabfSo1Yi2jWYQEY9tzgv-uFb5Ew&s=10',
  'trt news':
      'https://cdn.phototourl.com/member/2026-11-06-d5ad9d4f-de66-4642-8e03-07bcaf87a9a4.png',
  'trt music':
      'https://cdn.phototourl.com/member/2026-11-06-4724c440-1563-407c-9dc4-a91c63e36398.png',
  'trt kurdi':
      'https://cdn.phototourl.com/member/2026-11-06-cb4f8487-fbd7-4345-ba72-cbbf774014ff.jpg',
  'trt arabic':
      'https://cdn.phototourl.com/member/2026-11-06-95432689-79fc-421b-b75d-1144b90880db.png',
  'sky news':
      'https://cdn.phototourl.com/member/2026-11-06-94105922-6321-4850-97c3-6fcd3e18d396.jpg',
  'action hollywood':
      'https://cdn.phototourl.com/member/2026-11-07-9425922f-d3d3-450a-82b6-d3fc0d271e85.png',
  'cnn tv':
      'https://cdn.phototourl.com/anon/2026-11-15-3a42b099-0225-49d4-b4ef-14d23d75b13b.jpg',
  'netflix all':
      'https://cdn.phototourl.com/anon/2026-11-15-af0855d8-6997-46bf-931a-20f632f42b40.jpg',
  'iraqia kurdish':
      'https://cdn.phototourl.com/anon/2026-11-15-5bd9e592-4e1e-4179-9ca3-bd5ddf57ea3e.png',
  'iraqia news':
      'https://cdn.phototourl.com/anon/2026-11-15-d99d03b7-fab3-4eaa-bbb2-62fb35908352.png',
  'iraqia sport':
      'https://cdn.phototourl.com/anon/2026-11-15-762aa7b5-2f6d-4c9f-b06e-272ec55fb719.png',
  'peshmarga':
      'https://cdn.phototourl.com/anon/2026-11-15-33546b68-a0f2-441b-9aeb-8eb9f55e44a4.png',
  'diglah': 'https://dijlah.tv/LogoMob.png',
  'befrin':
      'https://cdn.phototourl.com/anon/2026-11-15-09641558-8251-4188-8877-79bd1d8c777e.jpg',
  'atv tv': 'https://iatv.tmgrup.com.tr/site/v2/i/atv-logo.png',
  'biner tv hd':
      'https://cdn.phototourl.com/anon/2026-11-15-24c20641-acfe-4e56-b248-4b0b24e03f1a.jpg',
  'alhadath':
      'https://cdn.phototourl.com/anon/2026-11-15-f445a5be-835f-452a-83e0-323425ff25b8.png',
  'mrbean':
      'https://cdn.phototourl.com/anon/2026-11-15-42a939da-db85-4508-85c4-7bba313a6578.jpg',
  'iraq 24 tv': 'https://www.iraq24hd.com/images/brand/iraq24-logo.webp',
  'znar kids': 'https://karwan.tv/wp-content/uploads/znar-kids.png',
  'ufc tv': 'https://i.postimg.cc/PqQjJHDY/images-(9).png',
  'dazn 1': 'https://i.postimg.cc/3xnMQ1QW/images-(10).png',
  'dazn 2': 'https://i.postimg.cc/3xnMQ1QW/images-(10).png',
  'dazn 3': 'https://i.postimg.cc/3xnMQ1QW/images-(10).png',
  'dazn 4': 'https://i.postimg.cc/3xnMQ1QW/images-(10).png',
  'nature time tv':
      'https://naturetimetv.com/wp-content/uploads/2023/05/NatureTime_Favicon.png',
  'kurdmax tv': 'https://karwan.tv/wp-content/uploads/kurdmax-tv-528x297-1.webp',
  'kurdmax music':
      'https://karwan.tv/wp-content/uploads/kurdmax-music-528x297.jpg',
  'kurdmax pepule': 'https://i.postimg.cc/cLZTZtQF/images-(20).jpg',
  'jazira tv': 'https://i.postimg.cc/MTyvWHbK/images-(11).png',
  'jazira tv 2': 'https://i.postimg.cc/gkyQvW4b/images-(21).jpg',
  'stv oremar':
      'https://i.postimg.cc/jSdgPJLn/813521040-1043768571806171-1476216989740550871-n.jpg',
  'bahrain sport 1': 'https://i.postimg.cc/k4rv1VXF/images-(22).jpg',
  'bahrain sport 2': 'https://i.postimg.cc/k4rv1VXF/images-(22).jpg',
  'bahrain tv': 'https://i.postimg.cc/cHMwFXzK/images-(12).png',
  'bahrain international': 'https://i.postimg.cc/ydBS30NC/images-(23).jpg',
  'bahrain quran': 'https://i.postimg.cc/5t5XJjSg/images-(24).jpg',
};

class ChannelModel {
  final String id;
  final String name;
  final String category;
  final String streamUrl;

  const ChannelModel({
    required this.id,
    required this.name,
    required this.category,
    required this.streamUrl,
  });

  String? get logoUrl => kChannelLogos[name.trim().toLowerCase()];
}

final List<ChannelModel> kChannels = [
  const ChannelModel(
    id: 'ava_tv_hd',
    name: 'ava tv hd',
    category: 'Kurdish',
    streamUrl: kAvaTvStreamUrl,
  ),
  const ChannelModel(
    id: 'rudaw_tv_hd',
    name: 'rudaw tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdistan24_tv_hd',
    name: 'kurdistan24 tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'speda_tv_hd',
    name: 'speda tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'gali_krd',
    name: 'gali krd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdsat_news',
    name: 'kurdsat news',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'nuce_tv_hd',
    name: 'nuçê tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'nrt_tv_hd',
    name: 'nrt tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'channel_8',
    name: 'channel 8',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mmn_news_tv_hd',
    name: 'mmn news tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'afarin_tv',
    name: 'afarin tv',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdistan_tv_hd',
    name: 'kurdistan tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'shar_tv_hd',
    name: 'shar tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'avar_tv_hd',
    name: 'avar tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdsat_tv_hd',
    name: 'kurdsat tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'welat_tv_hd',
    name: 'welat tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bask_tv_hd',
    name: 'bask tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'euro_kurd_tv',
    name: 'euro kurd tv',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'gk_plus_tv_hd',
    name: 'gk+ tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'peshang_tv_hd',
    name: 'peshang tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'red_tv_hd',
    name: 'red tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurd_7_tv_hd',
    name: 'kurd 7 tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'homzhyar_tv_hd',
    name: 'homzhyar tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'gewher_tv_hd',
    name: 'gewher tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'waar_tv_hd',
    name: 'waar tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'ava_family_tv',
    name: 'ava family tv',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'khak_tv_hd',
    name: 'khak tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'payam_tv_hd',
    name: 'payam tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: '4kurd_tv_hd',
    name: '4kurd tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'cira_tv_hd',
    name: 'cira tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'jin_tv_hd',
    name: 'jin tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurd_channel',
    name: 'kurd channel',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'shna_tv_hd',
    name: 'shna tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mix_kurdi_tv',
    name: 'mix kurdi tv',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'naqshi_media',
    name: 'naqshi media',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'rehber_tv',
    name: 'rehber tv',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'soran_tv',
    name: 'soran tv',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'sada_tv_hd',
    name: 'sada tv hd',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'zhin_tv_film',
    name: 'zhin tv film',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'speda_drama',
    name: 'speda drama',
    category: 'Kurdish',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'zarok_kurmanji',
    name: 'zarok kurmanji',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'zarok',
    name: 'zarok',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'gewher_kids',
    name: 'gewher kids',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kidco',
    name: 'kidco',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'zoomoo',
    name: 'zoomoo',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'toom_and_jerry',
    name: 'toom and jerry',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'ryan_and_freinds',
    name: 'ryan and freinds',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'abc_kids',
    name: 'abc kids',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'baby_shark',
    name: 'baby shark',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'maraya_kids',
    name: 'maraya kids',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'spacetoon',
    name: 'spacetoon',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'znar_kids',
    name: 'znar kids',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdmax_pepule',
    name: 'kurdmax pepule',
    category: 'Kids',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bangawaz_tv_hd',
    name: 'bangawaz tv hd',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'amojgari',
    name: 'amojgari',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'academy_amojgari',
    name: 'academy amojgari',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'eman_tv_hd',
    name: 'eman tv hd',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'farmooda_tv',
    name: 'farmooda tv',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'walla_quran',
    name: 'walla quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'imk_tv_hd',
    name: 'imk tv hd',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'imk_quran_tv',
    name: 'imk quran tv',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'spi_tv_quran',
    name: 'spi tv quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mmn_quran',
    name: 'mmn quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'ashti_quran',
    name: 'ashti quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mihrab_tv_hd',
    name: 'mihrab tv hd',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mihrab_fm_hd',
    name: 'mihrab fm hd',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'soz_tv_quran',
    name: 'soz tv quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'soz_tv',
    name: 'soz tv',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'rawshan',
    name: 'rawshan',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'saudi_quran',
    name: 'saudi quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'saudi_sunnah',
    name: 'saudi sunnah',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'makka_tv_live',
    name: 'makka tv live',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'ksa_quran_radio',
    name: 'ksa quran radio',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'sunnah_deng',
    name: 'sunnah deng',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bahrain_quran',
    name: 'bahrain quran',
    category: 'Religious',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'gewher_sport',
    name: 'gewher sport',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mmn_sport',
    name: 'mmn sport',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'iraqia_sport',
    name: 'iraqia sport',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'ufc_tv',
    name: 'ufc tv',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'dazn_1',
    name: 'dazn 1',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'dazn_2',
    name: 'dazn 2',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'dazn_3',
    name: 'dazn 3',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'dazn_4',
    name: 'dazn 4',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bahrain_sport_1',
    name: 'bahrain sport 1',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bahrain_sport_2',
    name: 'bahrain sport 2',
    category: 'Sports',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'barin_movies',
    name: 'barin movies',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'barin_family',
    name: 'barin family',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bnar_family',
    name: 'bnar family',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bnar_movies',
    name: 'bnar movies',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bnar_action',
    name: 'bnar action',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mmn_art',
    name: 'mmn art',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mmn_action',
    name: 'mmn action',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'action_hollywood',
    name: 'action hollywood',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'netflix_all',
    name: 'netflix all',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mrbean',
    name: 'mrbean',
    category: 'Movies & Series',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'mmn_documentary',
    name: 'mmn documentary',
    category: 'Documentary & Edu',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'perwerdayi_slemani',
    name: 'perwerdayi slemani',
    category: 'Documentary & Edu',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'perwerdayi_duhok',
    name: 'perwerdayi duhok',
    category: 'Documentary & Edu',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'perwerdayi_hewler',
    name: 'perwerdayi hewler',
    category: 'Documentary & Edu',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bbc_earth',
    name: 'bbc earth',
    category: 'Documentary & Edu',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'nature_time_tv',
    name: 'nature time tv',
    category: 'Documentary & Edu',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'qatar_tv',
    name: 'qatar tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'qatar_tv_2',
    name: 'qatar tv 2',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'watan_tv_hd',
    name: 'watan tv hd',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'zagros_tv',
    name: 'zagros tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'alghad',
    name: 'alghad',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'al_arabia_news',
    name: 'al arabia news',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'trt_1',
    name: 'trt 1',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'trt_news',
    name: 'trt news',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'trt_music',
    name: 'trt music',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'trt_kurdi',
    name: 'trt kurdi',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'trt_arabic',
    name: 'trt arabic',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'sky_news',
    name: 'sky news',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'cnn_tv',
    name: 'cnn tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'iraqia_kurdish',
    name: 'iraqia kurdish',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'iraqia_news',
    name: 'iraqia news',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'peshmarga',
    name: 'peshmarga',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'diglah',
    name: 'diglah',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'befrin',
    name: 'befrin',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'atv_tv',
    name: 'atv tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'show_tv',
    name: 'show tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'biner_tv_hd',
    name: 'biner tv hd',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'alhadath',
    name: 'alhadath',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'iraq_24_tv',
    name: 'iraq 24 tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdmax_tv',
    name: 'kurdmax tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'kurdmax_music',
    name: 'kurdmax music',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'jazira_tv',
    name: 'jazira tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'jazira_tv_2',
    name: 'jazira tv 2',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'stv_oremar',
    name: 'stv oremar',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bahrain_tv',
    name: 'bahrain tv',
    category: 'International & News',
    streamUrl: '',
  ),
  const ChannelModel(
    id: 'bahrain_international',
    name: 'bahrain international',
    category: 'International & News',
    streamUrl: '',
  ),
];

class KurdistanIptvApp extends StatelessWidget {
  const KurdistanIptvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KURDISTAN IPTV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0F14),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50914),
          secondary: Color(0xFFF5B700),
          surface: Color(0xFF171A21),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF13161E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const ChannelsHomeScreen(),
    );
  }
}

class ChannelsHomeScreen extends StatefulWidget {
  const ChannelsHomeScreen({super.key});

  @override
  State<ChannelsHomeScreen> createState() => _ChannelsHomeScreenState();
}

class _ChannelsHomeScreenState extends State<ChannelsHomeScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  final List<String> _categories = const [
    'All',
    'Kurdish',
    'Kids',
    'Religious',
    'Sports',
    'Movies & Series',
    'Documentary & Edu',
    'International & News',
  ];

  List<ChannelModel> get _filteredChannels {
    return kChannels.where((channel) {
      final matchesCategory =
          _selectedCategory == 'All' || channel.category == _selectedCategory;
      final matchesQuery = _searchQuery.trim().isEmpty ||
          channel.name.toLowerCase().contains(_searchQuery.trim().toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void _openChannel(ChannelModel channel) {
    if (channel.streamUrl.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لینکێ پەخشێ ${channel.name} هێشتا نەهاتیە دانان'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StrongLivePlayerScreen(channel: channel),
      ),
    );
  }

  void _openAboutSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF171A21),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  kAppLogoUrl,
                  width: 68,
                  height: 68,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.live_tv, size: 52, color: Colors.red),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'KURDISTAN IPTV',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'پەخشکرنا ڕاستەوخۆیا کەناڵان ب شێوازێ Portrait و Landscape',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.language, color: Colors.amber),
                title: const Text('ماڵپەڕ'),
                subtitle: const Text(kWebsiteUrl),
                onTap: () async {
                  final uri = Uri.parse(kWebsiteUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.email_outlined, color: Colors.amber),
                title: const Text('ئیمەیڵ'),
                subtitle: const Text(kSupportEmail),
                onTap: () async {
                  final uri = Uri(scheme: 'mailto', path: kSupportEmail);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final channels = _filteredChannels;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                kAppLogoUrl,
                width: 34,
                height: 34,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.live_tv, color: Colors.red),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'KURDISTAN IPTV',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _openAboutSheet,
            icon: const Icon(Icons.info_outline),
            tooltip: 'دەربارەی مە',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'لێگەڕان بۆ کەناڵی...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFF171A21),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 46,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  selectedColor: const Color(0xFFE50914),
                  backgroundColor: const Color(0xFF171A21),
                  onSelected: (_) {
                    setState(() => _selectedCategory = category);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: channels.isEmpty
                ? const Center(child: Text('هیچ کەناڵەک نەهاتە دیتن'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.15,
                    ),
                    itemCount: channels.length,
                    itemBuilder: (context, index) {
                      final channel = channels[index];
                      return ChannelCard(
                        channel: channel,
                        onTap: () => _openChannel(channel),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ChannelCard extends StatelessWidget {
  final ChannelModel channel;
  final VoidCallback onTap;

  const ChannelCard({
    super.key,
    required this.channel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasStream = channel.streamUrl.trim().isNotEmpty;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xFF171A21),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hasStream
                ? Colors.redAccent.withValues(alpha: 0.55)
                : Colors.white12,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ChannelLogoWidget(
                  logoUrl: channel.logoUrl,
                  channelName: channel.name,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                channel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                hasStream ? 'LIVE' : 'ب زوویی',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: hasStream ? Colors.redAccent : Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChannelLogoWidget extends StatelessWidget {
  final String? logoUrl;
  final String channelName;

  const ChannelLogoWidget({
    super.key,
    required this.logoUrl,
    required this.channelName,
  });

  @override
  Widget build(BuildContext context) {
    final url = logoUrl?.trim() ?? '';
    final isSvg = url.toLowerCase().endsWith('.svg');

    if (url.isEmpty || isSvg) {
      return _fallbackIcon();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        fit: BoxFit.contain,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (_, __, ___) => _fallbackIcon(),
      ),
    );
  }

  Widget _fallbackIcon() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222733),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          channelName.isNotEmpty ? channelName[0].toUpperCase() : 'TV',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

enum ScreenOrientationMode { auto, portrait, landscape }

class StrongLivePlayerScreen extends StatefulWidget {
  final ChannelModel channel;

  const StrongLivePlayerScreen({super.key, required this.channel});

  @override
  State<StrongLivePlayerScreen> createState() => _StrongLivePlayerScreenState();
}

class _StrongLivePlayerScreenState extends State<StrongLivePlayerScreen> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  ScreenOrientationMode _orientationMode = ScreenOrientationMode.auto;
  bool _hasError = false;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    setState(() {
      _hasError = false;
    });

    await _disposeControllers();

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.channel.streamUrl),
      httpHeaders: const {
        'User-Agent': 'KURDISTAN-IPTV/Flutter',
        'Connection': 'keep-alive',
      },
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: false,
        allowBackgroundPlayback: false,
      ),
    );

    _videoController = controller;

    try {
      await controller.initialize();
      await controller.play();

      _chewieController = ChewieController(
        videoPlayerController: controller,
        isLive: true,
        autoPlay: true,
        looping: false,
        showControls: true,
        allowFullScreen: true,
        allowMuting: true,
        bufferingBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorBuilder: (context, errorMessage) => _buildErrorView(errorMessage),
      );

      if (mounted) {
        setState(() {});
      }
    } catch (_) {
      if (!mounted) return;
      if (_retryCount < 3) {
        _retryCount++;
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) _initPlayer();
      } else {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  Future<void> _setOrientationMode(ScreenOrientationMode mode) async {
    setState(() {
      _orientationMode = mode;
    });

    if (mode == ScreenOrientationMode.portrait) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else if (mode == ScreenOrientationMode.landscape) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  Future<void> _disposeControllers() async {
    _chewieController?.dispose();
    _chewieController = null;
    await _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi_off, color: Colors.white70, size: 42),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              _retryCount = 0;
              _initPlayer();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('هەوڵبدەڤە'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isLandscape
          ? null
          : AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              title: Text(widget.channel.name),
            ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _hasError
                  ? _buildErrorView('پەخشێ کەناڵی نەهاتە کارکرن')
                  : (_chewieController != null &&
                          _videoController!.value.isInitialized)
                      ? Chewie(controller: _chewieController!)
                      : const CircularProgressIndicator(),
            ),
          ),
          Container(
            color: const Color(0xFF141414),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _OrientationChip(
                  label: 'Portrait',
                  icon: Icons.stay_current_portrait,
                  selected: _orientationMode == ScreenOrientationMode.portrait,
                  onTap: () =>
                      _setOrientationMode(ScreenOrientationMode.portrait),
                ),
                _OrientationChip(
                  label: 'Landscape',
                  icon: Icons.stay_current_landscape,
                  selected: _orientationMode == ScreenOrientationMode.landscape,
                  onTap: () =>
                      _setOrientationMode(ScreenOrientationMode.landscape),
                ),
                _OrientationChip(
                  label: 'Auto',
                  icon: Icons.screen_rotation,
                  selected: _orientationMode == ScreenOrientationMode.auto,
                  onTap: () => _setOrientationMode(ScreenOrientationMode.auto),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrientationChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _OrientationChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
      onSelected: (_) => onTap(),
    );
  }
}
