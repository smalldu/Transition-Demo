//
//  OverlayPresentationController.swift
//  Transition-Demo
//
//  Created by duzhe on 2017/10/20.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

class OverlayPresentationController: UIPresentationController {
  
  let dimmingView = UIView()
  
  // 在这个方法添加自定义的view和对他们执行动画
  override func presentationTransitionWillBegin() {
    guard let containerView = containerView else {
      return
    }
    containerView.addSubview(dimmingView)
    let dimmingViewInitailWidth = containerView.frame.width * 2 / 3, dimmingViewInitailHeight = containerView.frame.height * 2 / 3
    dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    dimmingView.center = containerView.center
    dimmingView.bounds = containerView.bounds
    dimmingView.alpha = 0
    //使用 transitionCoordinator 与转场动画并行执行 dimmingView 的动画。
    _ = presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 1
    }, completion: nil)
  }
  
  override func dismissalTransitionWillBegin() {
    _ = presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 0
    }, completion: nil)
  }
  
  override func containerViewWillLayoutSubviews() {
    guard let containerView = containerView else {
      return
    }
    dimmingView.center = containerView.center
    dimmingView.bounds = containerView.bounds
    let width = containerView.frame.width * 2 / 3, height = containerView.frame.height * 2 / 3
    presentedView?.center = containerView.center
    presentedView?.bounds = CGRect(x: 0, y: 0, width: width, height: height)
  }
  
  // override var shouldRemovePresentersView: Bool presentingView 是否在 presentation 转场结束后被移除：
  // 返回 true 时，presentation 结束后 presentingView 被移除
  
  
  
  
}



