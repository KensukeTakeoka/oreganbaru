//
//  SecondViewController.swift
//  ganbaruOre
//
//  Created by 武岡健介 on 2016/03/07.
//  Copyright © 2016年 Takeoka Kensuke. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var secondDayo: UITableView!
    var selectedIndex = -1
    var osusumeshop:[NSDictionary] = []
    var dic:NSDictionary?
    var name = String()
    var address = String()
    var longitude = Double()
    var latitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ファイルのパスを取得
        var filePath = NSBundle.mainBundle().pathForResource("secondnagoya", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        self.dic = NSDictionary(contentsOfFile: filePath!)
        var shopp:[NSDictionary] = []
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in dic!{
            shopp = data as! NSArray as! [NSDictionary]
        }
        for(data) in shopp{
            //            値を一個ずつ入れる　append
            osusumeshop.append(data as! NSDictionary)
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    行数
    func tableView(tableView :UITableView, numberOfRowsInSection section: Int) ->Int{
        return osusumeshop.count
        
    }
    //    表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell{
            var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
            
            name = osusumeshop[indexPath.row]["name"] as! String
            address = osusumeshop[indexPath.row]["address"] as! String
            //             longitude = nagoyafood[indexPath.row]["longtiude"] as! String
            //            latitude = nagoyafood[indexPath.row]["latitude"] as! String
            
            // picture = nagoyafood[indexPath.row]["picture"] as! String
            
            cell.textLabel?.text = "\(name)"
            
            
            cell.textLabel?.textColor = UIColor.greenColor()
            
            cell.textLabel!.font = UIFont.systemFontOfSize(20)
            cell.accessoryType =  .DisclosureIndicator
            
            
            return cell
            
    }
    //    選択された時に行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        //        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("genre")
        //        name = nagoyafood[indexPath.row]["name"] as! String
        //        longitude = atof(nagoyafood[indexPath.row]["longitude"] as! String)
        //        latitude = atof(nagoyafood[indexPath.row]["latitude"] as! String)
        
        selectedIndex = indexPath.row
        performSegueWithIdentifier("secondDetailsegue",sender: nil)
        
        
    }
    //    ステータスバーを非表示にする
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
        
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondVC = segue.destinationViewController as! SecondDetailViewController
        
        secondVC.scSelectedIndex = selectedIndex
        
    }
    
    
    @IBAction func secondRtnBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil)
        print("cancel")

        
        }

}
    








