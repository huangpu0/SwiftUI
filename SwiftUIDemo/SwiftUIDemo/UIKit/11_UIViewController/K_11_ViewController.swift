//
//  K_11_ViewController.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import UIKit
import SwiftUI

class K_11_ViewController: UIViewController {
    
    let push: UIButton = UIButton()
    
    let pop: UIButton = UIButton()

    var sss: NoParamsBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        push.frame = .init(x: 100, y: 100, width: 100, height: 100)
        push.backgroundColor = .red
        push.setTitle("Push按钮", for: .normal)
        self.view.addSubview(push)
        push.addTarget(self, action: #selector(pushEvent(_:)), for: .touchUpInside)
        
        pop.frame = .init(x: 100, y: 250, width: 100, height: 100)
        pop.backgroundColor = .red
        pop.setTitle("Pop按钮", for: .normal)
        self.view.addSubview(pop)
        pop.addTarget(self, action: #selector(popEvent(_:)), for: .touchUpInside)
        
    }
    

    @objc func pushEvent(_ btn: UIButton) -> Void {
        let vc = UIHostingController(rootView: K_10_WebView())
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func popEvent(_ btn: UIButton) -> Void {
        sss?()
    }
   
    deinit {
        print("deinit=\(self.classForCoder)")
    }
}
