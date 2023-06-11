//
//  InitialTabBarController.swift
//  CreatingCellsWithTime
//
//  Created by Rafael Oliveira on 09/06/23.
//

import Foundation
import UIKit
class InitialTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTab()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configureTab(){
        let vc1 = UINavigationController(rootViewController: ViewController())
        vc1.title = "Agenda"
        vc1.tabBarItem.image = UIImage(systemName: "calendar")
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        vc2.title = "Configurações"
        vc2.tabBarItem.image = UIImage(systemName: "gear")
        
        self.setViewControllers([vc1,vc2], animated: false)
    }
}


class SecondViewController: UIViewController {
    // JUST CREATED FOR FILL TABBAR
}
