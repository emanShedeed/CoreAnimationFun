//
//  RotateViewController.swift
//  CoreAnimationFun
//
//  Created by Eman Shedeed on 16/06/2023.
//

import UIKit

class RotateViewController: UIViewController {
    //MARK: Properties
    let redView = UIView()
    private let animateButton = UIButton(type: .system)
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
private extension RotateViewController{
    func style(){
        redView.backgroundColor = .systemRed
        animateButton.setTitle("Animate", for: [])
        animateButton.configuration = .filled()
        animateButton.addTarget(self, action: #selector(didTapAnimateButton), for: .primaryActionTriggered)
        
    }
    func layout(){
        redView.translatesAutoresizingMaskIntoConstraints = false
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        view.addSubview(animateButton)
        
        //redView
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.widthAnchor.constraint(equalToConstant: viewWidth),
            redView.heightAnchor.constraint(equalToConstant: viewHeight)
        ])
        
        //animateButton
        NSLayoutConstraint.activate([
            animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    func animate(){
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = 0
        print(CGFloat.pi)
        animation.toValue = CGFloat.pi/4 // 45 degree
        animation.duration = 1
        
        redView.layer.add(animation, forKey: "rotate")
        redView.layer.transform = CATransform3DMakeRotation(CGFloat.pi/4, 0, 0, 1)
        
    }
    
}

//MARK: Actions
private extension RotateViewController{
    @objc func didTapAnimateButton() {
        animate()
    }
}

