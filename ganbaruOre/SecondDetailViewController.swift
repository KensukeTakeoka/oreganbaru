//
//  SecondDetailViewController.swift
//  ganbaruOre
//
//  Created by 武岡健介 on 2016/03/15.
//  Copyright © 2016年 Takeoka Kensuke. All rights reserved.
//

import UIKit
import MapKit

class SecondDetailViewController: UIViewController {
    
    @IBOutlet weak var secondText: UITextView!
    @IBOutlet weak var secondDetail: MKMapView!
    var osusumeshop:[NSDictionary] = []
    var dic:NSDictionary?
    var scSelectedIndex = -1
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(scSelectedIndex)
        
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
//        plistからデータ取得
        var storeName = osusumeshop[scSelectedIndex]["name"] as! String
        
        self.navigationItem.title = storeName
        var address = osusumeshop[scSelectedIndex]["address"] as! String
        var phone = osusumeshop[scSelectedIndex]["phone"] as! String
        var hp = osusumeshop[scSelectedIndex]["hp"] as! String
        var holiday = osusumeshop[scSelectedIndex]["holiday"] as! String
        var hours = osusumeshop[scSelectedIndex]["hours"] as! String
//        キーボードを無くすコード
        secondText.editable = false
        
        secondText.text = "住所:\n\n\(address)\n\n連絡先:\n\n\(phone)\n\nホームページ:\n\n\(hp)\n\n定休日:\n\n\(holiday)\n\n営業時間:\n\n\(hours)\n\n"
        
        
        var recomendShop = osusumeshop[scSelectedIndex]["name"] as! String
        print(recomendShop)
        
        var longitude = atof(osusumeshop[scSelectedIndex]["longitude"] as! String)
        var latitude = atof(osusumeshop[scSelectedIndex]["latitude"] as! String)
        
        
        
        
        // Do any additional setup after loading the view.
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coordinate, span)
        
        //MapViewに設定
        secondDetail.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = storeName
        annotation.subtitle = address
        self.secondDetail.addAnnotation(annotation)
        
        
    
    
    
    
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
