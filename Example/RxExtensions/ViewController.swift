//
//  ViewController.swift
//  RxExtensions
//
//  Created by Corotata on 05/14/2018.
//  Copyright (c) 2018 Corotata. All rights reserved.
//

import UIKit
import RxExtensions
import RxSwift
class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //应用重新回到活动状态
        UIApplication.shared.rx
            .didBecomeActive
            .subscribe(onNext: { _ in
                print("ViewController" + "应用进入活动状态。")
            })
            .disposed(by: disposeBag)
        
        //应用从活动状态进入非活动状态
        UIApplication.shared.rx
            .willResignActive
            .subscribe(onNext: { _ in
                print("ViewController" + "应用从活动状态进入非活动状态。")
            })
            .disposed(by: disposeBag)
        
        //应用从后台恢复至前台（还不是活动状态）
        UIApplication.shared.rx
            .willEnterForeground
            .subscribe(onNext: { _ in
                print("ViewController" + "应用从后台恢复至前台（还不是活动状态）。")
            })
            .disposed(by: disposeBag)
        
        //应用进入到后台
        UIApplication.shared.rx
            .didEnterBackground
            .subscribe(onNext: { _ in
                print("ViewController" + "应用进入到后台。")
            })
            .disposed(by: disposeBag)
        
        //应用终止
        UIApplication.shared.rx
            .willTerminate
            .subscribe(onNext: { _ in
                print("ViewController" + "应用终止。")
            })
            .disposed(by: disposeBag)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

