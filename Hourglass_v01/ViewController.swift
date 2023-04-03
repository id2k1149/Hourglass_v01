//
//  ViewController.swift
//  Hourglass_v01
//
//  Created by Max Franz Immelmann on 4/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    let squareView = UIView()
    let circleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        addView(using: squareView, size: 0.95, color: .black)
        addView(using: circleView, size: 0.90, color: .white)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        squareView.layer.cornerRadius = squareView.frame.width / 4
        circleView.layer.cornerRadius = circleView.frame.width / 2
    }
}

extension UIViewController {
    func addView(using subview: UIView, size: CGFloat, color: UIColor) {
        
        let minSize = min(view.frame.height, view.frame.width) * size
        
        view.addSubview(subview)
        subview.backgroundColor = color
        subview.translatesAutoresizingMaskIntoConstraints = false

        subview.widthAnchor.constraint(equalToConstant: minSize).isActive = true
        subview.heightAnchor.constraint(equalTo: subview.widthAnchor).isActive = true

        subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
