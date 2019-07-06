//
//  ViewController.swift
//  logInTiwtter
//
//  Created by Anh vũ on 7/6/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    var loginbutton: TWTRLogInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginbutton = TWTRLogInButton{(session, error) in
            if let unwrappedsession = session {
                let client = TWTRAPIClient()
                client.loadUser(withID: (unwrappedsession.userID), completion: { (user, error) in
                    print("Name : \(user?.name)")
                     print("userName : \(unwrappedsession.userName)")
                    let imgurl = user?.profileImageURL
                    
                    
                })
            }else {
                print(error?.localizedDescription)
            }
        }
        loginbutton.center = self.view.center
        self.view.addSubview(loginbutton)
    }


}

