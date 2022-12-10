// ignore_for_file: camel_case_types, prefer_final_fields, non_constant_identifier_names, unused_local_variable

import 'package:musik/colors/colors.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/playlistmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:musik/widgets/playlists/screenPlaylist.dart';

class playLists extends StatefulWidget {
  const playLists({super.key});

  @override
  State<playLists> createState() => _playListsState();
}

class _playListsState extends State<playLists> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController controller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  final formGlobalKey1 = GlobalKey<FormState>();

  List<PlaylistSongs> playlist = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text(
              "P",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey),
            ),
            Text(
              "laylilst",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => bottomSheet(context),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                )),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [PlaylistList()],
          ),
        ),
      ),
    );
  }

  PlaylistList() {
    if (playlist.isEmpty) {
      const Padding(
        padding: EdgeInsets.all(15.0),
        child: Align(
          heightFactor: 7.5,
          child: Center(
              child: Text(
            'No Playlist Created',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          )),
        ),
      );
    }
    return ValueListenableBuilder<Box<PlaylistSongs>>(
        valueListenable: playlistbox.listenable(),
        builder: (context, value, child) {
          List<PlaylistSongs> playlist = value.values.toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: playlist.length,
              itemBuilder: ((context, index) {
                if (playlistbox.isEmpty) {
                  final controller = playlist[index].playlistname!;
                  const Center(
                    child: Text(
                      "Playlist Not Created",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                }
                if (playlist.isEmpty) {
                  const Center(
                    child: Text(
                      "Playlist Not Created",
                      style: TextStyle(
                          fontSize: 13.43,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                }
                return Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ScreenPlaylist(
                                  allPlaylistSongs:
                                      playlist[index].playlistssongs!,
                                  playlistindex: index,
                                  playlistname:
                                      playlist[index].playlistname!)))),
                      leading: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          'assets/musify.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // leading: Icon(
                      //   Icons.queue_music_rounded,
                      //   color: Colors.white,
                      //   size: 35,
                      // ),
                      title: Text(
                        playlist[index].playlistname.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      bottomSheetedit(context, index),
                                );
                              },
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.grey,
                              )),
                          IconButton(
                            onPressed: (() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 50, 50, 50),
                                    title: const Text(
                                      "Delete Playlist",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text(
                                      "Are You Sure ?",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 213, 213, 213)))),
                                      TextButton(
                                          onPressed: () {
                                            playlistbox.deleteAt(index);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Delete",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 213, 213, 213))))
                                    ],
                                  );
                                },
                              );
                            }),
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
            ),
          );
        });
  }

  //----------------------------------------ADD PLAYLIST POP UP--------------------------------------------------

  Widget bottomSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 423 * 0.7,
          color: bottomsheetColor,
          child: Column(
            children: [playlistform(context)],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetedit(BuildContext context, int index) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: height * 0.30,
          color: bottomsheetColor,
          child: Column(
            children: [editBottom(context, index)],
          ),
        ),
      ),
    );
  }

  Padding playlistform(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "C",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey),
              ),
              Text(
                "reate Playlist",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: formGlobalKey,
            child: TextFormField(
              controller: _textEditingController,
              cursorHeight: 25,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black,
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.5)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.5)),
                hintText: "Enter a name",
                hintStyle: TextStyle(color: Color.fromARGB(255, 137, 137, 137)),
              ),
              validator: (value) {
                List<PlaylistSongs> values = playlistbox.values.toList();

                bool isAlreadyAdded = values
                    .where((element) => element.playlistname == value!.trim())
                    .isNotEmpty;

                if (value!.trim() == '') {
                  return 'Name required';
                }
                if (value.trim().length > 15) {
                  return 'Enter Characters below 10 ';
                }

                if (isAlreadyAdded) {
                  return 'Name Already Exists';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          formButtons(context)
        ],
      ),
    );
  }

  Row formButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            child: const Text("Cancel")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            onPressed: () {
              final isValid = formGlobalKey.currentState!.validate();
              if (isValid) {
                playlistbox.add(PlaylistSongs(
                    playlistname: _textEditingController.text,
                    playlistssongs: []));
                Navigator.pop(context);
              }
            },
            child: const Text("Create"))
      ],
    );
  }

  Widget editBottom(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  "E",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey),
                ),
                Text(
                  "dit Playlist",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: formGlobalKey1,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: controller,
                cursorHeight: 25,
                decoration: const InputDecoration(
                  filled: true,
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.5)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5)),
                  hintText: "Enter a name",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  List<PlaylistSongs> values = playlistbox.values.toList();

                  bool isAlreadyAdded = values
                      .where((element) => element.playlistname == value!.trim())
                      .isNotEmpty;

                  if (value!.trim() == '') {
                    return 'Name Required';
                  }
                  if (value.trim().length > 15) {
                    return 'Enter Characters below 15 ';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            formButtonsedit(context, index)
          ],
        ),
      ),
    );
  }

  Row formButtonsedit(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            onPressed: () {
              final isValid = formGlobalKey1.currentState!.validate();
              if (isValid) {
                playlistbox.putAt(
                    index,
                    PlaylistSongs(
                        playlistname: controller.text, playlistssongs: []));
                Navigator.pop(context);
              }
            },
            child: const Text("Edit"))
      ],
    );
  }
}
