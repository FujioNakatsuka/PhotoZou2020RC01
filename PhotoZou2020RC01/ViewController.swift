//
//  ViewController.swift
//  PhotoZou2020RC01
//
//  Created by 中塚富士雄 on 2020/06/08.
//  Copyright © 2020 中塚富士雄. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,XMLParserDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var parser = XMLParser()
    var currentElementName:String!
    var mobile_access_Label = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

