//
//  SecondOsusumeViewController.swift
//  ganbaruOre
//
//  Created by 武岡健介 on 2016/03/08.
//  Copyright © 2016年 Takeoka Kensuke. All rights reserved.
//

import UIKit
import MapKit

class SecondOsusumeViewController: UIViewController {

    @IBOutlet weak var secondFoodMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let coordinate = CLLocationCoordinate2DMake(10.311715, 123.918332);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coordinate, span)
        
        //MapViewに設定
        secondFoodMap.setRegion(region, animated: true)
        
      

        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "title"
        annotation.subtitle = "subtitle"
        secondFoodMap.addAnnotation(annotation)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}