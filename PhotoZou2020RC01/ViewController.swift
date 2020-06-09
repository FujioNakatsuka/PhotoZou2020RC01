//
//  ViewController.swift
//  PhotoZou2020RC01
//
//  Created by 中塚富士雄 on 2020/06/08.
//  Copyright © 2020 中塚富士雄. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,XMLParserDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var parser = XMLParser()
    var currentElementName:String!
//    var mobile_access_Label = UILabel()
//    var address_Label = UILabel()
    
    var dataModel = [DataModel]()
    var imageVIew = UIImageView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
   
        tableView.delegate = self
        tableView.dataSource = self
   
        let urlString:String = "https://api.photozou.jp/rest/search_public?type=photo&keyword=夏空"
        
        
        //PercentEncoding
        let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let photozouurl:URL = URL(string: encodeUrlString)!
        
        self.parser = XMLParser(contentsOf: photozouurl)!
        
        self.parser.delegate = self
        self.parser.parse()
    
    }

    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
     }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return dataModel.count
     }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 402
     }
    
    
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let dataItem = self.dataModel[indexPath.row]

        imageVIew = cell.contentView.viewWithTag(1) as! UIImageView
        
        imageView.sd_setImage(with: URL(string:dataItem.image_url!), placeholderImage: UIImage(named: "noimage"), options:.continueInBackground, completed:nil)
        
        return cell

    }
 
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    currentElementName = nil
    if elementName == "photo"{
    self.dataModel.append(DataModel())
    }else{
    currentElementName = elementName
    }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
    if self.dataModel.count > 0{
    //[1]
    let lastItem = self.dataModel[self.dataModel.count - 1]
    switch self.currentElementName{
    case "image_url":
    lastItem.image_url = string
    default:break
    }
}
    
}
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentElementName = nil
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    
}
