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

        // Do any additional setup after loading the view.
        let coodinate = CLLocationCoordinate2DMake(10.311715, 123.918332);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.5, 0.5)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coodinate, span)
        
        //MapViewに設定
        secondFoodMap.setRegion(region, animated: true)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}