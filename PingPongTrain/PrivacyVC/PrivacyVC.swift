//
//  PrivacyVC.swift
//  PingPongTrain
//
//  Created by Apple on 8/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct PrivacyModel {
    var title: String
    var privacy: String
}

class PrivacyVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        LCManager.shared.getPrivacy {[weak self] (result, error) in
            guard let data = result else { self?.toLoginVC(); return}
            let pWebVC = PrivacyDVC(dtitle: data.title, dUrl: [data.privacy])
            pWebVC.setDBack(emgker: "", ortmw: "", w4imgk3: "", wegkp3: {
                self?.toLoginVC()
            })
            self?.present(pWebVC, animated: true, completion: nil)
        }
    }
    
    func toLoginVC() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
