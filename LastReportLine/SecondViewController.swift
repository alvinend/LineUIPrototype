//
//  SecondViewController.swift
//  LastReportLine
//
//  Created by Endratno　Alvin on 2019/07/02.
//  Copyright © 2019 Endratno　Alvin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var userDefaults: UserDefaults!
    static var chatWho = 0;
    var data = [["田中","abc is the first data"],["山田","this is string not int"],["砂糖","英語でiloveyou"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! SecondSubTableViewCell
        
            cell.secChatName?.text = data[indexPath.row][0]
        
            cell.secChat?.text = "いや何でもない"
            if(indexPath.row == 0){
                var Arr = userDefaults.array(forKey: "tanakaMsgs") as! [String]
                cell.secChat?.text = Arr[Arr.count - 1]
            }
        
            if(indexPath.row == 1){
                var Arr = userDefaults.array(forKey: "yamadaMsgs") as! [String]
                cell.secChat?.text = Arr[Arr.count - 1]
            }
        
            if(indexPath.row == 2){
                var Arr = userDefaults.array(forKey: "satouMsgs") as! [String]
                cell.secChat?.text = Arr[Arr.count - 1]
            }
        
        
            cell.secImage.image = #imageLiteral(resourceName: "DP.png")
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        SecondViewController.chatWho = indexPath.row;
      
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let editViewController = storyBoard.instantiateViewController(withIdentifier: "ChatCon") as! ChatController
        
        self.present(editViewController, animated:true, completion:nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults = UserDefaults.standard
        userDefaults.register(defaults: ["tanakaMsgs": [],"yamadaMsgs": [],"satouMsgs": []])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    @IBOutlet weak var tableView: UITableView!
    
}

