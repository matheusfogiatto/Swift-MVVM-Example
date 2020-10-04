//
//  UIViewController+Extensions.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertError(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func alert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    /// Create a new empty controller instance with given view
    ///
    /// - Parameters:
    ///   - view: view
    ///   - frame: frame
    /// - Returns: instance
    static func newController(withView view: UIView, frame: CGRect) -> UIViewController {
        view.frame = frame
        let controller = UIViewController()
        controller.view = view
        return controller
    }
    
    /// Changes the current storyboard based on given StoryboardID using its default initial view controller as root.
    /// - Parameter storyboardReference: Storyboard name
    func goToStoryboard(storyboardReference: String) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: storyboardReference, bundle: nil)
            if let viewController = storyboard.instantiateInitialViewController(){
                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.setRootViewController(viewController)
            }
        }
    }
    
    /// Changes the current storyboard based on given StoryboardID using given view controller reference as initial view controller
    /// - Parameter storyboardReference: Storyboard name
    /// - Parameter atViewController: ViewController ID
    func goToStoryboard(storyboardReference: String, atViewController: String) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: storyboardReference, bundle: nil)
            let viewController = storyboard.instantiateViewController(identifier: atViewController)
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.setRootViewController(viewController)
        }
    }
    
    /// Push onto the view stack the inital view controller from given storyboard
    /// - Parameter storyboardReference: Storyboard name
    func pushInitialViewControllerFromStoryboard(storyboardReference: String) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: storyboardReference, bundle: nil)
            if let viewController = storyboard.instantiateInitialViewController() {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    /// Push onto the view stack the refered view controller from given storyboard
    /// - Parameter storyboardReference: Storyboard name
    func pushViewControllerFromStoryboard(storyboardReference: String, atViewController: String) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: storyboardReference, bundle: nil)
            let viewController = storyboard.instantiateViewController(identifier: atViewController)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func presentModallyViewController(storyboardReference: String, atViewController: String) {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardReference, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: atViewController)

        viewController.modalPresentationStyle = UIModalPresentationStyle.popover
        viewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical

        self.present(viewController, animated: true, completion: nil)
    }
    
}
