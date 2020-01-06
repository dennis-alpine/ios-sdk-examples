#import "OrnamentsLayoutExample.h"

@import Mapbox;

NSString *const MBXExampleOrnamentsLayout = @"OrnamentsLayoutExample";

@interface OrnamentsLayoutExample ()<MGLMapViewDelegate>

@end

@implementation OrnamentsLayoutExample

- (void)viewDidLoad {
    [super viewDidLoad];

    // Initialize mapView with some center.
    MGLMapView *mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.915143, 116.404053)
                       zoomLevel:16
                       direction:30
                        animated:NO];
    
    // Configure mapView to show the scale and always display the compass.
    mapView.delegate = self;
    mapView.showsScale = YES;
    mapView.compassView.compassVisibility = MGLOrnamentVisibilityVisible;
    
    // Set positions of various ornaments via `MGLOrnamentPosition` enum.
    // NOTE: You can be more prescriptive about where the ornaments are positioned by using
    // the `scaleBarMargins` , `compassViewMargins`, `logoViewMargins` and `attributionButtonMargins` properties.
    mapView.scaleBarPosition = MGLOrnamentPositionTopRight;
    mapView.compassViewPosition = MGLOrnamentPositionTopLeft;
    mapView.logoViewPosition = MGLOrnamentPositionBottomRight;
    mapView.attributionButtonPosition = MGLOrnamentPositionBottomLeft;
    
    [self.view addSubview:mapView];
}

@end
