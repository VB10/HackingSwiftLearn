//
//  Image+Extensions.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 15.09.2023.
//

import Foundation
import SwiftUI

extension Image {
    func circleShapeWithBorder() -> some View {
        return self.clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 2))
    }
}
