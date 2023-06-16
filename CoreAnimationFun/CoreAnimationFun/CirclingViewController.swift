//
//  CirclingViewController.swift
//  CoreAnimationFun
//
//  Created by Eman Shedeed on 16/06/2023.
//

import UIKit

class CirclingViewController: UIViewController {
    //MARK: Properties
    let redView = UIView()
    private let animateButton = UIButton(type: .system)
    private let viewHeight = 40.0
    private let viewWidth = 40.0
    
    private let redCircle = UIImageView()
    private let _diameter: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        style()
        layout()
    }


}
//MARK: Private Methods
private extension CirclingViewController{
    func style(){
        redView.backgroundColor = .systemRed
        animateButton.setTitle("Animate", for: [])
        animateButton.configuration = .filled()
        animateButton.addTarget(self, action: #selector(didTapAnimateButton), for: .primaryActionTriggered)
        //
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: _diameter, height: _diameter))

              let img = renderer.image { ctx in
                  let rectangle = CGRect(x: 0, y: 0, width: _diameter, height: _diameter)

                  ctx.cgContext.setStrokeColor(UIColor.red.cgColor)
                  ctx.cgContext.setFillColor(UIColor.clear.cgColor)
                  ctx.cgContext.setLineWidth(1)
                  ctx.cgContext.addEllipse(in: rectangle)
                  ctx.cgContext.drawPath(using: .fillStroke)
              }

              redCircle.image = img
    }
    func layout(){
        redView.translatesAutoresizingMaskIntoConstraints = false
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        redCircle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        view.addSubview(animateButton)
        view.addSubview(redCircle)
        
        //redView
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.widthAnchor.constraint(equalToConstant: viewWidth),
            redView.heightAnchor.constraint(equalToConstant: viewHeight)
        ])
        
        //redCircle
        NSLayoutConstraint.activate([
            redCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redCircle.widthAnchor.constraint(equalToConstant: _diameter),
            redCircle.heightAnchor.constraint(equalToConstant: _diameter)
        ])
        
       // animateButton
        
        NSLayoutConstraint.activate([
            animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func animate() {
        let boundingRect = CGRect(x: -_diameter/2, y: -_diameter/2, width: _diameter, height: _diameter)
        
        let orbit = CAKeyframeAnimation()
        orbit.keyPath = "position"
        
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil)
        
        
        orbit.duration = 2
        orbit.isAdditive = true
        orbit.repeatCount = 2.0
        orbit.calculationMode = CAAnimationCalculationMode.paced;
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto;
        
        redView.layer.add(orbit, forKey: "redbox")
    }
    
}

//MARK: Actions
private extension CirclingViewController{
    @objc func didTapAnimateButton() {
        animate()
    }
}
