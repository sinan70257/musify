import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/animation.dart';
import 'package:on_audio_query/on_audio_query.dart';

// AssetsAudioPlayer player = AssetsAudioPlayer();
AudioPlayer _player = AudioPlayer();
List<SongModel> songs = [];
String currentSongTitle = " ";
String currrentArtist = " ";
int currentIndex = 0;
bool isPlayerVisible = false;
late AnimationController _animationController;
bool toggle = false;
Duration progress1 = Duration();

bool isPlaying = false;
