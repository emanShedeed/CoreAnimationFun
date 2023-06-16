//
//  MoveViewController.swift
//  CoreAnimationFun
//
//  Created by Eman Shedeed on 16/06/2023.
//

import UIKit

class MoveViewController: UIViewController {
    
    //MARK: Properties
    private let redView = UIView()
    private let animateButton = UIButton(type: .system)
    private let viewHeight = 100.0
    private let viewWidth = 140.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

//MARK: Private Methods
private extension MoveViewController{
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
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
        animation.keyPath = "position.x"
        animation.fromValue = 20 + viewWidth/2
        animation.toValue = UIScreen.main.bounds.width - (viewWidth/2 + 10)
        animation.duration = 1
        
        redView.layer.add(animation, forKey: "Move")
//        redView.layer.position = CGPoint(x:  (UIScreen.main.bounds.width - (viewWidth/2 + 10)), y: 20 + viewHeight/2)
        
    }
    
}

//MARK: Actions
private extension MoveViewController{
    @objc func didTapAnimateButton() {
        animate()
    }
}
