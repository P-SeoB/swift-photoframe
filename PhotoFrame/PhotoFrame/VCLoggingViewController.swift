//
//  VCLoggingViewController.swift
//  PhotoFrame
//
//  Created by 박진섭 on 2022/05/05.
//

import UIKit

class VCLoggingViewController: UIViewController {
    private struct LogGlobals {
        var prefix = ""
        var instanceCounts = [String:Int]()
        var lastLogTime = Date()
        var indentationInterval: TimeInterval = 1
        var indentationString = "__"
    }
    
    private static var logGlobals = LogGlobals()
    
    private static func logPrifix(for loggingName: String) -> String {
        if logGlobals.lastLogTime.timeIntervalSinceNow < -logGlobals.indentationInterval {
            logGlobals.prefix += logGlobals.indentationString
            print("")
        }
        logGlobals.lastLogTime = Date()
        return logGlobals.prefix + loggingName
    }
    private static func bumpInstanceCount(for loggingName: String ) -> Int {
        logGlobals.instanceCounts[loggingName] = (logGlobals.instanceCounts[loggingName] ?? 0) + 1
        return logGlobals.instanceCounts[loggingName]!
    }
    
    private var instanceCount: Int!
    
    //콘솔에 로그를 남길때 이 string을 이용해서 식별할 수 있다.
    //이것을 서브클래스로 하지않으면 그냥 클래스의 이름을 사용하게 된다.
    var vc1LoggingName: String {
        return String(describing: type(of: self))
    }
    
    //구조체의 이름이나 속한 클래스의 이름을 출력해줌.
    private func logVCL(_ msg: String) {
        if instanceCount == nil {
            instanceCount = VCLoggingViewController.bumpInstanceCount(for: vc1LoggingName)
        }
        print("\(VCLoggingViewController.logPrifix(for: vc1LoggingName))(\(instanceCount!))\(msg)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        logVCL("init(coder:) - created via InterfaceBuiler")
    }
    
    override init(nibName nibNameOrNil: String?,bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        logVCL("init(nibName:bundle:) - create to code")
    }
    
    deinit {
        logVCL("left the heap")
    }
    
    override func awakeFromNib() {
        logVCL("awakeFromNib()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logVCL("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logVCL("viewWillAppear(animated = \(animated)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logVCL("viewDidAppear(animated = \(animated)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logVCL("viewWillDisappear(animated = \(animated)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logVCL("viewDidDisappear(animated = \(animated)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        logVCL("didReciveMemoryWarning")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logVCL("viewWillLayoutSubViews() bounds.size = \(view.bounds.size)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logVCL("viewDidLayoutSubViews() bounds.size = \(view.bounds.size)")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            logVCL("viewWillTransition(to: \(size), with: coordinator)")
        coordinator.animate(alongsideTransition: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in self.logVCL("begin animate(alongsideTransition:completion:)")},completion: {context in self.logVCL("end animate(alongsideTransition:completion:)")
          })
        }
}
