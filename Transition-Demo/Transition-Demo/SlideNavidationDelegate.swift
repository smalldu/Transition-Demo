//
//  SlideNavidationDelegate.swift
//  Transition-Demo
//
//  Created by duzhe on 2017/10/19.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

class SlideNavidationDelegate: NSObject, UINavigationControllerDelegate {
  
  var interactive = false
  let interactionController = UIPercentDrivenInteractiveTransition()
  
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let slideAnimator = SlideAnimator()
    return slideAnimator
  }
  
  func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return interactive ? self.interactionController : nil
  }
}






