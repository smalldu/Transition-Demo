//
//  PresentViewController.swift
//  Transition-Demo
//
//  Created by duzhe on 2017/10/20.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
  let presentTransitionDelegate = ModelTransitionDelegate()
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @IBAction func presentPage(_ sender: Any) {
    let overlayVC = OverlayViewController(nibName: "OverlayViewController", bundle: nil)
    overlayVC.transitioningDelegate = presentTransitionDelegate
    overlayVC.modalPresentationStyle = .custom
    self.present(overlayVC, animated: true, completion: nil)
    
  }
  
}

