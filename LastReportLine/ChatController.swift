//
//  ChatController.swift
//  LastReportLine
//
//  Created by Endratno　Alvin on 2019/07/16.
//  Copyright © 2019 Endratno　Alvin. All rights reserved.
//

import UIKit

struct ChatMsg{
    let text:String
    let isIncoming:Bool
}


var userDefaults: UserDefaults!

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate let cellid = "id123"
    @IBOutlet weak var Name: UILabel!
    
    var tanakaMsgs = [
        ChatMsg(text: "abc is the first data", isIncoming: true),
        ChatMsg(text: "え？", isIncoming: false),
        ChatMsg(text: "いや何でもない", isIncoming: true)
    ]
    var Text :[String] = []
    func setTanaka(Arr:[String]){
        Arr.forEach { chat in
            tanakaMsgs.append(ChatMsg(text: chat, isIncoming: false))
        }
    }
    
    func setYamada(Arr:[String]){
        Arr.forEach { chat in
            yamadaMsgs.append(ChatMsg(text: chat, isIncoming: false))
        }
    }
    
    func setSatou(Arr:[String]){
        Arr.forEach { chat in
            satouMsgs.append(ChatMsg(text: chat, isIncoming: false))
        }
    }
    
    var yamadaMsgs = [
        ChatMsg(text: "this is string not int", isIncoming: true),
        ChatMsg(text: "え？", isIncoming: false),
        ChatMsg(text: "いやなんでもない", isIncoming: true)
    ]
    var satouMsgs = [
        ChatMsg(text: "英語でiloveyou", isIncoming: true),
        ChatMsg(text: "え？", isIncoming: false),
        ChatMsg(text: "いや何でもない", isIncoming: true)
    ]
  

    
    var chatMsgs = [
        ChatMsg(text: "TESSS", isIncoming: true),
        ChatMsg(text: "TESSS2", isIncoming: true),
        ChatMsg(text: "TESSS3", isIncoming: false)
    ]
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMsgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
            as! ChatCell
        
        let chatMsg = chatMsgs[indexPath.row]
        
        cell.chatMsg = chatMsg
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults = UserDefaults.standard
        userDefaults.register(defaults: ["tanakaMsgs": [],"yamadaMsgs": [],"satouMsgs": []])
        
        
        if(SecondViewController.chatWho == 0){
            Name.text = "田中"
            chatMsgs = tanakaMsgs
        }
        
        if(SecondViewController.chatWho == 1){
            Name.text = "山田"
            chatMsgs = yamadaMsgs
        }
        
        if(SecondViewController.chatWho == 2){
            Name.text = "砂糖"
            chatMsgs = satouMsgs
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatCell.self, forCellReuseIdentifier: cellid)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(SecondViewController.chatWho == 0){
            Text = userDefaults.array(forKey: "tanakaMsgs") as! [String]
            setTanaka(Arr: Text)
            Name.text = "田中"
            chatMsgs = tanakaMsgs
        }
        
        if(SecondViewController.chatWho == 1){
            Text = userDefaults.array(forKey: "yamadaMsgs") as! [String]
            setYamada(Arr: Text)
            Name.text = "山田"
            chatMsgs = yamadaMsgs
        }
        
        if(SecondViewController.chatWho == 2){
            Text = userDefaults.array(forKey: "satouMsgs") as! [String]
            setSatou(Arr: Text)
            Name.text = "砂糖"
            chatMsgs = satouMsgs
        }
        
        tableView.reloadData()
    }
    
    @IBAction func back(_ sender: Any) {
        if(SecondViewController.chatWho == 0){
            userDefaults.set(Text, forKey: "tanakaMsgs")
        }
        
        if(SecondViewController.chatWho == 1){
            userDefaults.set(Text, forKey: "yamadaMsgs")
        }
        
        if(SecondViewController.chatWho == 2){
            userDefaults.set(Text, forKey: "satouMsgs")
        }
        
        dismiss(animated: true)
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Send(_ sender: Any) {
        chatMsgs.append(ChatMsg(text: textField.text!, isIncoming: false))
        Text.append(textField.text!)
        tableView.reloadData()
        textField.text = "";
    }
    
    @IBOutlet weak var textField: UITextField!
    
}
