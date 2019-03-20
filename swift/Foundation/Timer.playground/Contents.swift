import UIKit

// TIMER
// link - https://www.hackingwithswift.com/articles/117/the-ultimate-guide-to-timer

class ViewController: UIViewController {
    
    var runCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var runCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            print("Timer fired!")
            runCount += 1
            
            if runCount == 3 {
                timer.invalidate()
            }
        }
        
        let context = ["user": "@twostraws"]
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: context, repeats: true)
    }
    
    @objc func fireTimer(timer: Timer) {
        guard let context = timer.userInfo as? [String: String] else { return }
        let user = context["user", default: "Anonymous"]
        
        print("Timer fired by \(user)!")
        runCount += 1
        
        if runCount == 3 {
            timer.invalidate()
        }
    }
  
}

let viewController = ViewController()

let window = UIWindow(frame: UIScreen.main.bounds)
window.rootViewController = viewController
window.makeKeyAndVisible()



