//
//  ScaleViewController.swift
//  CoreAnimationFun
//
//  Created by Eman Shedeed on 16/06/2023.
//

import UIKit

class ScaleViewController: UIViewController {
    
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
private extension ScaleViewController{
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
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.6
        
        redView.layer.add(animation, forKey: "scale")
        redView.layer.transform = CATransform3DMakeScale(2, 2, 1)
        
    }
    
}

//MARK: Actions
private extension ScaleViewController{
    @objc func didTapAnimateButton() {
        animate()
    }
}
