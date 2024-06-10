import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_state.dart';
import 'image_widget.dart';

class InfiniteImageList extends StatefulWidget {
  final bool isCat;
  final double width;

  const InfiniteImageList({Key? key, required this.isCat, required this.width}) : super(key: key);

  @override
  _InfiniteImageListState createState() => _InfiniteImageListState();
}

class _InfiniteImageListState extends State<InfiniteImageList> {
  final _scrollController = ScrollController();
  late ImageBloc _imageBloc;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _imageBloc = ImageBloc(widget.isCat);
    _imageBloc.add(FetchImage('RND', 10, _currentPage));
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      bloc: _imageBloc,
      builder: (context, state) {
        if (state is ImageLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ImageLoaded) {
          _currentPage = state.page ?? 0;
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.hasReachedMax
                ? state.images.length
                : state.images.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.images.length) {
                _currentPage++;
                _imageBloc.add(FetchImage('RND', 10, _currentPage));
                return Center(child: CircularProgressIndicator());
              }
              final image = state.images[index];
              return Column(
                  children: [
                    ImageWidget(
                width: widget.width,
                imageUrl: image.url,
                imageWidth: image.width,
                imageHeight: image.height,
              ),
                    SizedBox(height: 10)
              ])
              ;
            },
          );
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _imageBloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _imageBloc.add(FetchImage('RND', 10, _currentPage + 1));
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
