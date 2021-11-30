class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  
  final List<Marker> _markers = <Marker>[];
  Animation<double>? _animation;
  late GoogleMapController _controller;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
 
  final _mapMarkerSC = StreamController<List<Marker>>();
  StreamSink<List<Marker>> get _mapMarkerSink => _mapMarkerSC.sink;
  Stream<List<Marker>> get mapMarkerStream => _mapMarkerSC.stream;
  
  @override
  void initState() {
    super.initState();
    
    setUpMarker();
    
    //Starting the animation after 1 second.
    Future.delayed(const Duration(seconds: 1)).then((value) {
      
        animateCar(
          37.42796133580664,
          -122.085749655962,
          37.428714, 
          -122.078301,
          _mapMarkerSink,
          this,
          _controller,
        );
      });
  }
  
}