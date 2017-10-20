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
      toView.bounds = CGRect(origin: .zero, size: CGSize(width: toViewWidth, height: toViewHeight))
      toView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
      UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
        toView.transform = CGAffineTransform.identity
      }, completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
    // Dismissal 不要将 toView 添加到containerView
    if fromVC.isBeingDismissed{
//      let fromViewHeight = fromView.frame.height
      fromView.transform = CGAffineTransform.identity
      UIView.animate(withDuration: duration, animations: {
        fromView.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
      }, completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
  }
  
}


