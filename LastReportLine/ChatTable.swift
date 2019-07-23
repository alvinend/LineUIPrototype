//
//  ChatTable.swift
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

class ChatTable: UITableView {

    fileprivate let cellid = "id123"
    
    
    
    let chatMsgs = [
        ChatMsg(text: "TESSS", isIncoming: true),
        ChatMsg(text: "TESSS2", isIncoming: true),
        ChatMsg(text: "TESSS3", isIncoming: false)
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatCell.self, forCellReuseIdentifier: cellid)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        let footerView = UIView()
        footerView.backgroundColor = .black
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        
        
        tableView.tableFooterView = footerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
            as! ChatCell
        
        let chatMsg = chatMsgs[indexPath.row]
        
        cell.chatMsg = chatMsg
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMsgs.count
    }

}
