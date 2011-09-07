//
//  OfflineMapTestViewController.m
//  OfflineMapTest
//
//  Created by Thijs Scheepers on 07-09-11.
//  Copyright 2011 Infinite Droplets. All rights reserved.
//

#import "OfflineMapTestViewController.h"
#import "RMDBMapSource.h"

@implementation OfflineMapTestViewController

@synthesize mapview;

-(id)init {
    
    if([super init]) {
       
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    mapview = [[RMMapView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f)];
    [mapview setBackgroundColor:[UIColor whiteColor]];
    mapview.delegate = self;	
    
    id <RMTileSource> tileSource = [[[RMDBMapSource alloc] initWithPath:@"tiles.db"] autorelease];
    
    RMMapContents *rmcontents = [[RMMapContents alloc] initWithView:mapview tilesource:tileSource]; 
    
    [rmcontents setTileSource:tileSource];
    //[rmcontents setMaxZoom:14.0f];
    //[rmcontents setMinZoom:13.0f];
    
    [rmcontents setZoom:15.0f];
    
    CLLocationCoordinate2D demoCoordinate;
    
    demoCoordinate.latitude = 52.24324;
    demoCoordinate.longitude = 6.85206;
    
    [rmcontents setMapCenter:demoCoordinate];
    
    [self.view addSubview:mapview];	
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

}

#pragma mark - View lifecycle


- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
