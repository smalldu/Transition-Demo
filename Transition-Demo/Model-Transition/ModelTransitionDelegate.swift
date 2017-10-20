//
//  ModelTransitionDelegate.swift
//  Transition-Demo
//
//  Created by duzhe on 2017/10/20.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

class ModelTransitionDelegate: NSObject,UIViewControllerTransitioningDelegate {
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return OverlayAnimator()
  }
  
  // 获取自定义的animator
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return OverlayAnimator()
  }
  
  // 这个方法用来获取自定义的 UIPresentationController
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return OverlayPresentationController(presentedViewController: presented, presenting: presenting)
  }
}
