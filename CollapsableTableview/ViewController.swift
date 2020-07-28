//
//  ViewController.swift
//  CollapsableTableview
//
//  Created by macos on 28/07/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data = [ Datamodel(headerName: "Man", subType: ["Pent","Shirt","Shuit"], isExpandable: false),Datamodel(headerName: "Woman", subType: ["Skirt","Crop Top","Dress","Kurta"], isExpandable: false),Datamodel(headerName: "Child", subType: ["BabaShuit","Dyper","Shuit","pent"], isExpandable: false)]
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }


}
extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let Header = HeaderView(frame: CGRect(x: 10, y: 10, width: self.tbl.frame.size.width - 20, height: 30))
        Header.delegate = self
        Header.SecIndex = section
        Header.btn.setTitle(data[section].headerName, for: .normal)
        return Header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExpandable
        {
            return data[section].subType.count

        }
        else
        {
            return 0
        }
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = data[indexPath.section].subType[indexPath.row]
        return cell!
    }

}
extension ViewController: headerDelegate
{
    func callHeader(idx: Int) {
        data[idx].isExpandable = !data[idx].isExpandable
        tbl.reloadSections([idx], with: .automatic)
    }
    
    
}
