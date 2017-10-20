//
//  OverlayAnimator.swift
//  Transition-Demo
//
//  Created by duzhe on 2017/10/20.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit


class OverlayAnimator: NSObject,UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.3
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    guard let fromVC = transitionContext.viewController(forKey: .from) , let toVC = transitionContext.viewController(forKey: .to) else
    {
      return
    }
    guard let fromView = fromVC.view else { return }
    guard let toView = toVC.view else { return }
    let duration = self.transitionDuration(using: transitionContext)
    
    if toVC.isBeingPresented {
      containerView.addSubview(toView)
      let rate: CGFloat = 2/3
      let toViewWidth = containerView.frame.width * rate
      let toViewHeight = containerView.frame.height * rate
      toView.center = containerView.center
      toView.bounds = CGRect(origin: .zero, size: CGSize(width: 1, height: toViewHeight))
      UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
        toView.bounds = CGRect(origin: .zero, size: CGSize(width: toViewWidth, height: toViewHeight))
      }, completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
    // Dismissal 不要将 toView 添加到containerView
    if fromVC.isBeingDismissed{
      let fromViewHeight = fromView.frame.height
      UIView.animate(withDuration: duration, animations: {
        fromView.bounds = CGRect(x: 0, y: 0, width: 1, height: fromViewHeight)
      }, completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
  }
  
}


