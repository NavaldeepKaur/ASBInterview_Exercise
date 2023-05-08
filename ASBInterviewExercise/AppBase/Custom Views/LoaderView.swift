//
//  LoaderView.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 04/05/23.
//
import UIKit

class LoaderView: UIView {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    static let shared = LoaderView.view()
    
    static func view() -> LoaderView {
        let outlets = Bundle.main.loadNibNamed("LoaderView", owner: self, options: nil)
        var obj: LoaderView?
        for outlet in outlets ?? [] {
            if let out = outlet as? LoaderView {
                out.activity.superview!.layer.cornerRadius = 6.0
                obj = out
                break
            }
        }
        return obj!
    }

    func show() {
        if let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first {
            showIn(view: window)
        }
    }
    
    func showIn(view: UIView) {
        DispatchQueue.main.async {
            self.frame = view.bounds
            self.alpha = 0.0
            self.activity.startAnimating()
            view.addSubview(self)
            UIView.animate(withDuration: 0.3) {
                self.alpha = 1.0
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 0.0
            }) { (finished) in
                self.activity.stopAnimating()
                self.removeFromSuperview()
            }
        }
    }
}
