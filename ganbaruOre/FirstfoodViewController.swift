//
//  FirstfoodViewController.swift
//  ganbaruOre
//
//  Created by 武岡健介 on 2016/03/08.
//  Copyright © 2016年 Takeoka Kensuke. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class FirstfoodViewController: UIViewController {

    @IBOutlet weak var firstFoodBtn: UIButton!
    @IBOutlet weak var firstFoodMap: MKMapView!
    var nagoyafood:[NSDictionary] = []
    var dic:NSDictionary?
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var lm : CLLocationManager! = nil
    
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

        
        self.lm = CLLocationManager()
        
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示.
        
            self.lm.requestWhenInUseAuthorization()
        }
            
            self.lm.startUpdatingLocation()

        // Do any additional setup after loading the view.
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.5, 0.5)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coordinate, span)
        
        //MapViewに設定
        firstFoodMap.setRegion(region, animated: true)
        
        
        // pinを立てる
        for nagoyafood_each in nagoyafood {
            var longitude = atof(nagoyafood_each["longitude"] as! String)
            var latitude = atof(nagoyafood_each["latitude"] as! String)
            
            var coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            
            var annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = nagoyafood_each["name"] as! String
            annotation.subtitle = nagoyafood_each["address"] as! String
            self.firstFoodMap.addAnnotation(annotation)
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstFoodsBtn(sender: AnyObject) {
        
        
        self.dismissViewControllerAnimated(false, completion: nil)
        print("cancel")    }
    
}