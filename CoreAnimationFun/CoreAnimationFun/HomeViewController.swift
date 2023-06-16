//
//  HomeViewController.swift
//  CoreAnimationFun
//
//  Created by Eman Shedeed on 16/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: Properities

    let animationTableView = UITableView()

    let tableItems: [(name:String,viewController:UIViewController)] = [
        (name: "Move", viewController: MoveViewController()),
        (name: "Scaling", viewController: ScaleViewController()),
        (name: "Rotation", viewController: RotateViewController()),
        (name: "Shake", viewController: ShakeViewController()),
        (name: "Circling", viewController: CirclingViewController())
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        style()
        layout()
    }


}

private extension HomeViewController {
    func setup(){
        animationTableView.delegate = self
        animationTableView.dataSource = self
    }
    
    func style(){
        navigationItem.title = "Core Animation Intro"
        
    }
    
    func layout(){
        animationTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationTableView)
        
        NSLayoutConstraint.activate([
            animationTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(tableItems[indexPath.row].viewController, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = tableItems[indexPath.row].name
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .body)
//        content.secondaryText = "test"
        cell.contentConfiguration = content
        return cell
    }
    
    
}
