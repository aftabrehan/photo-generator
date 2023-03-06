//
//  ViewController.swift
//  Random Photo
//
//  Created by Aftab Rehan on 06/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemGreen,
        .systemYellow,
        .systemOrange
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        view.addSubview(imageView)
        imageView.frame = CGRectMake(0, 0, 300, 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        generateRandomImage()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
   @objc func didTapButton() {
        generateRandomImage()
       
       view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRectMake(30, view.frame.size.height-150-view.safeAreaInsets.bottom, view.frame.size.width-60, 60)
    }
    
    func generateRandomImage() {
        let urlString = "https://source.unsplash.com/300x300"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

