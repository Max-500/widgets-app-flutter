import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIDs = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoadging = false;
  bool isMounted = true;

  @override
  void initState(){
    super.initState();
    
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
    },);
  }

  @override
  void dispose(){
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveImages(){
    final lastID = imagesIDs.last;
    imagesIDs.addAll(
      [1,2,3,4,5].map((e) => lastID + e)
    );
  }

  Future<void> loadNextPage() async {
    if( isLoadging ) return;

    isLoadging = true;
    setState(() {});

    await Future.delayed(const Duration(seconds:  2));

    addFiveImages();
    
    isLoadging = false;

    if(!isMounted) return;
    setState(() {});
    moveToScrollBottom();
  }

  Future<void> onRefresh() async {
    isLoadging = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted ) return;
    isLoadging = false;
    final lastID = imagesIDs.last;
    isLoadging = true;
    imagesIDs.clear();
    imagesIDs.add(lastID + 1);
    addFiveImages();
    setState(() {});
  }

  void moveToScrollBottom() {
    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(seconds: 2), 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIDs.length,
            itemBuilder: ((context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIDs[index]}/500/300'),
                );
            })
            ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isLoadging ? 
                  FadeIn(child: SpinPerfect(infinite: true,child: const Icon( Icons.refresh_outlined ),)) 
                : 
                  FadeIn(child: const Icon( Icons.arrow_back_ios_new_outlined ))
        ),
    );
  }
}