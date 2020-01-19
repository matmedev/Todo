//
//  UIApplicationExtension.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 19..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
