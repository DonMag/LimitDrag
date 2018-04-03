//
//  ViewController.swift
//  LimitDrag
//
//  Created by Don Mag on 4/3/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var canvas: UIView!
	
	@IBOutlet var textViewCenterXConstraint: NSLayoutConstraint!
	@IBOutlet var textViewCenterYConstraint: NSLayoutConstraint!
	
	var currentCenterXConstant: CGFloat = 0.0
	var currentCenterYConstant: CGFloat = 0.0
	
	@IBAction func handleDragOfCaption(_ sender: UIPanGestureRecognizer) {

		guard let senderView = sender.view else { return }
		guard let parentView = senderView.superview else { return }
		
		// get the current pan movement - relative to the view (the text view, in this case)
		let translation = sender.translation(in: canvas)
		
		switch sender.state {
		case .began:
			// save the current Center X and Y constants
			currentCenterXConstant = textViewCenterXConstraint.constant
			currentCenterYConstant = textViewCenterYConstraint.constant
			break
			
		case .changed:
			// update the Center X and Y constants
			textViewCenterXConstraint.constant = currentCenterXConstant + translation.x
			textViewCenterYConstraint.constant = currentCenterYConstant + translation.y
			break
			
		case .ended, .cancelled:
			// update the Center X and Y constants based on the final position of the dragged view
			textViewCenterXConstraint.constant = senderView.center.x - parentView.frame.size.width / 2.0
			textViewCenterYConstraint.constant = senderView.center.y - parentView.frame.size.height / 2.0
			break
			
		default:
			break
			
		}

	}

}

