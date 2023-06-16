//
//  ShakeViewController.swift
//  CoreAnimationFun
//
//  Created by Eman Shedeed on 16/06/2023.
//

import UIKit

class ShakeViewController: UIViewController {
    //MARK: Properties
    private let shakeButton = UIButton(type: .system)
    private let viewHeight = 100.0
    private let viewWidth = 140.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        style()
        layout()
    }


}
//MARK: Private Methods
private extension ShakeViewController{
    func style(){
    
        shakeButton.setTitle("Shake", for: [])
        shakeButton.configuration = .filled()
        shakeButton.addTarget(self, action: #selector(didTapAnimateButton), for: .primaryActionTriggered)
        
    }
    func layout(){
        shakeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shakeButton)
        
        //animateButton
        NSLayoutConstraint.activate([
            shakeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shakeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    func animate(){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0,5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        shakeButton.layer.add(animation, forKey: "shake")
//        shakeButton.layer.
        
    }
    
}

//MARK: Actions
private extension ShakeViewController{
    @objc func didTapAnimateButton() {
        animate()
    }
}

