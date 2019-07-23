//
//  FirstViewController.swift
//  LastReportLine
//
//  Created by Endratno　Alvin on 2019/07/02.
//  Copyright © 2019 Endratno　Alvin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var friendAndGroup = [
        ["田中", "山田", "砂糖"],
        ["A Group", "B Group"]
    ]
    
    var titles = ["Friends", "Groups"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendAndGroup.count
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.headerView(forSection: 0)?.backgroundColor = .blue
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendAndGroup[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let groupCell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! FirstGroupTableViewCell
        
        groupCell.groupName?.text = friendAndGroup[indexPath.section][indexPath.row]
        groupCell.groupImg.image = #imageLiteral(resourceName: "DP.png")
        
        
        
        return groupCell
    }
    
    


    override func viewDidLoad() {
        let userDefaults = UserDefaults.standard
        userDefaults.register(defaults: ["friendAndGroup" : friendAndGroup])
        friendAndGroup = userDefaults.array(forKey: "friendAndGroup") as! [[String]]
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 0){
        
        SecondViewController.chatWho = indexPath.row;
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let editViewController = storyBoard.instantiateViewController(withIdentifier: "ChatCon") as! ChatController
        
        self.present(editViewController, animated:true, completion:nil)
        
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
}

