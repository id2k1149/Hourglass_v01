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
    
    // properties
        var timer: Timer?
        let hourglassView = HourglassView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        addView(using: squareView, size: 0.95, color: .black)
        addView(using: circleView, size: 0.90, color: .white)
        
        //        addActivityIndicatorView()
        
        // add the hourglass view as a subview
        view.addSubview(hourglassView)
        
        // set the frame of the hourglass view
        hourglassView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        hourglassView.center = view.center
        
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateElapsedTime),
                                     userInfo: nil, repeats: true)
        
        
    }
    
    // updates the elapsed time of the hourglass view
        @objc func updateElapsedTime() {
            hourglassView.elapsedTime += 1.0
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
    
    func addActivityIndicatorView() {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)

        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

//        let topLabel = UILabel()
//        topLabel.text = "Loading"
//        view.addSubview(topLabel)
//
//        topLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            topLabel.bottomAnchor.constraint(equalTo: activityIndicatorView.topAnchor, constant: -8)
//        ])

        let bottomLabel = UILabel()
        bottomLabel.text = "Please wait..."
        view.addSubview(bottomLabel)

        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 8)
        ])
    }
    
    
}
