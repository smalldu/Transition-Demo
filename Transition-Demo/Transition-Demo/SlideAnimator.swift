//
//  SlideAnimator.swift
//  Transition-Demo
//
//  Created by duzhe on 2017/10/19.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

class SlideAnimator: NSObject , UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let toView = transitionContext.view(forKey: .to) else { return }
    guard let fromView = transitionContext.view(forKey: .from) else { return }
    let containerView = transitionContext.containerView
    // 将toView添加到容器视图中，使得其在屏幕上显示
    containerView.addSubview(toView)
    
    let toViewTransform = CGAffineTransform.identity.translatedBy(x: 0, y: toView.bounds.height)
    let fromViewTransform = CGAffineTransform.identity.translatedBy(x: 0, y: -toView.bounds.height)
    toView.transform = toViewTransform
    
    let duration = self.transitionDuration(using: transitionContext)
    UIView.animate(withDuration: duration, animations: {
      toView.transform = CGAffineTransform.identity
      fromView.transform = fromViewTransform
    }) { _ in
      //考虑到转场中途可能取消的情况，转场结束后，恢复视图状态。
      toView.transform = CGAffineTransform.identity
      fromView.transform = CGAffineTransform.identity
      // 动画结束后正确地结束转场过程。转场的结果有两种：完成或取消。非交互转场的结果只有完成一种情况，不过交互式转场需要考虑取消的情况。如何结束取决于转场的进度，通过transitionWasCancelled()方法来获取转场的结果，然后使用completeTransition:来通知系统转场过程结束，这个方法会检查动画控制器是否实现了animationEnded:方法，如果有，则调用该方法。
      let isCancelled = transitionContext.transitionWasCancelled
      transitionContext.completeTransition(!isCancelled)
    }
    
  }
  
}





