//
//  ViewController.swift
//  delegateTest
//
//  Created by Yuki Shinohara on 2020/07/16.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TestDelegate {
///このVCはUIViewControllerとTestDelegateに準拠
///TestDelegateに準拠→要件を守る必要(この場合, testという関数を持つこと)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testClass = TestClass()
        testClass.delegate = self
        testClass.delegateTest()
///TestClassインスタンス化→delegateをViewControllerに設定→処理をVCで行う(確認用。プリントされる)
    }
    
    func test(string: String) {
      print(string)
    }
///TestDelegateに準拠するために上記関数を設置(何もアクションもないが、ないとエラーになる)
}

protocol TestDelegate: class {
    func test(string: String)
}
///TestDelegateというプロトコル(準拠するならこれらの変数や関数を持つ必要があるという決まり)
///TestDelegateに準拠するなら、testという文字列を引数にとる関数が必要

class TestClass {
    weak var delegate: TestDelegate?
    func delegateTest() {
        delegate?.test(string: "test メソッドが実行されたという通知を受け取る")
    }
///TestDelegateであるdelegateという変数を持つTestClassというクラス
///
}
