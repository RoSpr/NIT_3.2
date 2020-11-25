//
//  ViewController.swift
//  NIT_3.2
//
//  Created by Родион Сприкут on 25.11.2020.
//

import UIKit

class ViewController: UIViewController {

    private lazy var PanGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(
        target: self,
        action: #selector(tappableViewDidSlide(_:))
    )
    
    var MainLabel: UILabel!
    var MainView: UIView!
    
    var labelNumber = 0
    var lastTranslation = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainLabel = UILabel(frame: CGRect(x: 0, y: 70, width: 120, height: 21))
        MainLabel.center.x = view.center.x
        MainLabel.text = "\(labelNumber)"
        MainLabel.textAlignment = .center
        view.addSubview(MainLabel)
        
        MainView = UIView(frame: CGRect(x: 0, y: 110, width: view.frame.width - 50, height: (view.frame.width - 50) / 2))
        MainView.backgroundColor = UIColor(red: 255/255, green: 127/255, blue: 88/255, alpha: 0.7)
        MainView.center.x = view.center.x
        view.addSubview(MainView)
        
        MainView.addGestureRecognizer(PanGestureRecognizer)
        MainView.isUserInteractionEnabled = true
    }

    @objc func tappableViewDidSlide(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            labelNumber -= Int(sender.translation(in: MainView).y)
            MainLabel.text = "\(labelNumber)"
        default: break
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}

