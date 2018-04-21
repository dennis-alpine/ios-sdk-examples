#import "DDSCircleLayerTutorialViewController.h"

@import Mapbox;

@interface DDSCircleLayerTutorialViewController () <MGLMapViewDelegate>

@end

@implementation DDSCircleLayerTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // #-code-snippet: expressions initialize-map-objc
    MGLMapView *mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL: [MGLStyle lightStyleURL]];
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    mapView.centerCoordinate = CLLocationCoordinate2DMake(44.971, -93.261);
    mapView.zoomLevel = 10;
    
    [self.view addSubview:mapView];
    mapView.delegate = self;
    // #-end-code-snippet: expressions initialize-map-objc
}


- (void)mapView:(MGLMapView *)mapView didFinishLoadingStyle:(MGLStyle *)style {
    
    // #-code-snippet: expressions add-layer-objc
    MGLSource *source = [[MGLVectorTileSource alloc] initWithIdentifier:@"historical-places" configurationURL:[NSURL URLWithString:@"mapbox://examples.5zzwbooj"]];
    
    [mapView.style addSource:source];

    MGLCircleStyleLayer *layer = [[MGLCircleStyleLayer alloc] initWithIdentifier:@"landmarks" source:source];
    
    layer.sourceLayerIdentifier = @"HPC_landmarks-b60kqn";
    
    layer.circleColor = [NSExpression expressionForConstantValue:[UIColor colorWithRed:0.67 green:0.28 blue:0.13 alpha:1.0]];
    
    layer.circleOpacity = [NSExpression expressionForConstantValue:@"0.8"];

    NSDictionary *zoomStops = @{
                                @10: [NSExpression expressionWithFormat:@"(Constructi - 2018) / 30"],
                                @13: [NSExpression expressionWithFormat:@"(Constructi - 2018) / 10"]
    };
    
    layer.circleRadius = [NSExpression expressionWithFormat:@"mgl_interpolate:withCurveType:parameters:stops:(Constructi, 'linear', nil, %@)", zoomStops];
    
    [mapView.style addLayer:layer];
    // #-end-code-snippet: expressions add-layer-objc
}

@end
