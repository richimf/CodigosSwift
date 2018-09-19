import UIKit

protocol Animatable {
    func pulse(duration: TimeInterval)
}

extension Animatable where Self: UIView {
    func pulse(duration: TimeInterval) {
        UIView.animate(withDuration: duration/2, animations: {
            self.alpha = 0
        }) { _ in
            UIView.animate(withDuration: duration/2, animations: {
                self.alpha = 1
            })
        }
    }
}

protocol Borderable {
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
}

extension Borderable where Self: UIView {
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
}

class MyView: UIView, Animatable, Borderable {
    
}

var myView = MyView()
myView.pulse(duration: 0.5)
myView.cornerRadius = 10
myView.borderWidth = 1











