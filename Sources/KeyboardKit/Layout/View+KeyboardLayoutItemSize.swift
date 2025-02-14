//
//  View+KeyboardLayoutItemSize.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-09-19.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Apply a keyboard layout item size to the view.
    ///
    /// The `edgeInsets` can be used to add intrinsic insets
    /// within the interactable button area.
    ///
    /// - Parameters:
    ///   - item: The layout item to apply.
    ///   - rowWidth: The total row width (often screen width).
    ///   - inputWidth: The width in points of an input item.
    func keyboardLayoutItemSize(
        for item: KeyboardLayout.Item,
        rowWidth: CGFloat,
        inputWidth: CGFloat,
        heightMinusTwo: Bool = false
    ) -> some View {
        if heightMinusTwo {
            self.frame(height: item.size.height - item.edgeInsets.top - item.edgeInsets.bottom - 2)
                .rowItemWidth(
                    for: item,
                    rowWidth: rowWidth,
                    inputWidth: inputWidth
                )
        } else {
            self.frame(height: item.size.height - item.edgeInsets.top - item.edgeInsets.bottom)
                .rowItemWidth(
                    for: item,
                    rowWidth: rowWidth,
                    inputWidth: inputWidth
                )
        }
    }
}

private extension View {
    
    @ViewBuilder
    func rowItemWidth(
        for item: KeyboardLayout.Item,
        rowWidth: CGFloat,
        inputWidth: CGFloat
    ) -> some View {
        let width = item.width(forRowWidth: rowWidth, inputWidth: inputWidth)
        if let width, width > 0 {
            self.frame(width: width)
        } else {
            self.frame(maxWidth: .infinity)
        }
    }
}
