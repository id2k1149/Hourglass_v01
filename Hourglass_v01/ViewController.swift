//
//  ViewController.swift
//  Hourglass_v01
//
//  Created by Max Franz Immelmann on 4/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    let squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        addBlackSquareView(using: squareView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        squareView.layer.cornerRadius = squareView.frame.width / 4
    }

    
}

extension UIViewController {
    func addBlackSquareView(using subview: UIView) {
        
        let minSize = min(view.frame.height, view.frame.width) * 0.95
        
        view.addSubview(subview)
        subview.backgroundColor = .black
        subview.translatesAutoresizingMaskIntoConstraints = false

        subview.widthAnchor.constraint(equalToConstant: minSize).isActive = true
        subview.heightAnchor.constraint(equalTo: subview.widthAnchor).isActive = true

        subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
 
