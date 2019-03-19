//
//  ViewController.swift
//  HangMan
//
//  Created by Emin Roblack on 3/15/19.
//  Copyright © 2019 Emin Roblack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var letters = [UIButton]()
  let buttonsView = UIView()
  let label = UILabel()
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = .cyan
    
    label.text = "??????????"
    label.font = UIFont.systemFont(ofSize: 36)
    view.addSubview(label)
    
    buttonsView.backgroundColor = .orange
    view.addSubview(buttonsView)
    
    // TAMIC
    label.translatesAutoresizingMaskIntoConstraints = false
    buttonsView.translatesAutoresizingMaskIntoConstraints = false
    //-------------------------------------------------------------

    // Keyboard view layout
    NSLayoutConstraint.activate([
      buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
      buttonsView.heightAnchor.constraint(equalToConstant: 200),
      buttonsView.widthAnchor.constraint(equalToConstant: 280),
      buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      label.bottomAnchor.constraint(equalTo: buttonsView.topAnchor, constant: -40),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      ])
    
    // Generating keyboard
    var scalar = 97
    for row in 0..<4 {
      for collumn in 0..<7 {
        createButton(row: row, collumn: collumn, letter: scalar)
        if scalar < 122{
        scalar += 1
        } else {
          return
        }
        
      }
    }
    //-------------------------------------------------------------
    
    

    
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @objc func letterTapped() {
    //
  }
  
  func createButton(row: Int, collumn: Int, letter: Int) {
    
    var width = 40
    let height = 50
    guard let buttonLetter = UnicodeScalar(letter) else { return}
    
    let letterButton = UIButton(type: .roundedRect)
    letterButton.layer.cornerRadius = 10
    letterButton.setTitle(String(buttonLetter).uppercased(), for: .normal)
    letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    letterButton.layer.borderColor = UIColor.black.cgColor
    letterButton.layer.borderWidth = 1
    letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
    
    if row == 3 {
      width = 55
      letterButton.frame = CGRect(x: collumn * width + 10, y: row * height, width: 36, height: 44)
    } else {
      letterButton.frame = CGRect(x: collumn * width, y: row * height, width: 36, height: 44)
    }

    letters.append(letterButton)
    buttonsView.addSubview(letterButton)
  }


}

