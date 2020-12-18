//
//  UIHelper.swift
//  RxSwiftMVVMNewsApp
//
//  Created by Evgeniy Uskov on 18.12.2020.
//

import Foundation
import UIKit

public class UIHelper {
    static func setupNavBar(vc: UIViewController) {
            let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = Constants.navBarColor
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            
        vc.navigationController?.navigationBar.standardAppearance = navBarAppearance
        vc.navigationController?.navigationBar.compactAppearance = navBarAppearance
        vc.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        }
}
