//
//  FirstDetailViewController.swift
//  ganbaruOre
//
//  Created by 武岡健介 on 2016/03/15.
//  Copyright © 2016年 Takeoka Kensuke. All rights reserved.
//

import UIKit
import MapKit

class FirstDetailViewController: UIViewController {

    @IBOutlet weak var firsyDetail: MKMapView!
    @IBOutlet weak var firstText: UITextView!
    var nagoyafood:[NSDictionary] = []
    var dic:NSDictionary?
    var scSelectedIndex = Int()
    override func viewDidLoad() {
       
        super.viewDidLoad()
        print(scSelectedIndex)
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

        var storeName = nagoyafood[scSelectedIndex]["name"] as! String
        print(storeName)
        
        var longitude = atof(nagoyafood[scSelectedIndex]["longitude"] as! String)
        var latitude = atof(nagoyafood[scSelectedIndex]["latitude"] as! String)
        
        //        plistから情報を取り出す
        var address = nagoyafood[scSelectedIndex]["address"] as! String

        var phone = nagoyafood[scSelectedIndex]["phone"] as! String

        var hp = nagoyafood[scSelectedIndex]["hp"] as! String


        var holiday = nagoyafood[scSelectedIndex]["holiday"] as! String

        var hours = nagoyafood[scSelectedIndex]["hours"] as! String

//        文字を出なくする
//        secondText.editable = false
        
        //        キーボードを無くすコード
        firstText.editable = false
        
        firstText.text = "住所:\n\(address)連絡先:\n\(phone)ホームページ:\n\(hp)定休日:\n\(holiday)営業時間:\n\(hours)"
       
        
        
        
        // Do any additional setup after loading the view.
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coordinate, span)
        
        //MapViewに設定
        firsyDetail.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "title"
        annotation.subtitle = "subtitle"
        self.firsyDetail.addAnnotation(annotation)
        
    }

        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
