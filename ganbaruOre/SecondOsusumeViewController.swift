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

    @IBOutlet weak var secondBtnList: UIButton!
    @IBOutlet weak var secondFoodMap: MKMapView!
    var osusumeshop:[NSDictionary] = []
    var dic:NSDictionary?
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        //ファイルのパスを取得
        var filePath = NSBundle.mainBundle().pathForResource("secondnagoya", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        self.dic = NSDictionary(contentsOfFile: filePath!)!
        var shopp:[NSDictionary] = []
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in self.dic!{
            shopp = data as! NSArray as! [NSDictionary]
        }
        for(data) in shopp{
            //            値を一個ずつ入れる　append
            osusumeshop.append(data as NSDictionary)
            
        }
        
        var longitude = atof(osusumeshop[1]["longitude"] as! String)
        var latitude = atof(osusumeshop[1]["latitude"] as! String)
        
        
        
        
        // Do any additional setup after loading the view.
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coordinate, span)
        
        //MapViewに設定
        secondFoodMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "title"
        annotation.subtitle = "subtitle"
        self.secondFoodMap.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func secondBtnList(sender: UIButton) {
        //self.dismissViewControllerAnimated(false, completion: nil)
        print("cancel")
    
    
    
    }
    
}
        
       