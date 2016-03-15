//
//  FirstfoodViewController.swift
//  ganbaruOre
//
//  Created by 武岡健介 on 2016/03/08.
//  Copyright © 2016年 Takeoka Kensuke. All rights reserved.
//

import UIKit
import MapKit

class FirstfoodViewController: UIViewController {

    @IBOutlet weak var firstFoodBtn: UIButton!
    @IBOutlet weak var firstFoodMap: MKMapView!
    var nagoyafood:[NSDictionary] = []
     var dic:NSDictionary?
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ファイルのパスを取得
        var filePath = NSBundle.mainBundle().pathForResource("firstnagoya", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        self.dic = NSDictionary(contentsOfFile: filePath!)!
        var misokatsu:[NSDictionary] = []
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in self.dic!{
            misokatsu = data as! NSArray as! [NSDictionary]
        }
        for(data) in misokatsu{
            //            値を一個ずつ入れる　append
            nagoyafood.append(data as NSDictionary)
            
        }
        
        var longitude = atof(nagoyafood[1]["longitude"] as! String)
        var latitude = atof(nagoyafood[1]["latitude"] as! String)


      

        // Do any additional setup after loading the view.
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coordinate, span)
        
        //MapViewに設定
        firstFoodMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "title"
        annotation.subtitle = "subtitle"
        self.firstFoodMap.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstFoodsBtn(sender: UIButton) {
    }
    
}