/*
 
 The MIT License (MIT)
 Copyright (c) 2017-2018 Dalton Hinterscher
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
 to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
 ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import UIKit

class NotificationBannerUtilities: NSObject {

    /// The y offset taken from safe area `top` or `bottom` depending on the position of the banner
    /// - parameters:
    ///     - bannerPosition: the position where the banner gets displayed (top or bottom)
    ///     - parentView: the view from which these isents should be taken, effectively a parent view on which the banner gets displayed
    class func yOffset(for bannerPosition: BannerPosition, on parentView: UIView?) -> CGFloat {

        let safeAreaInsets = NotificationBannerUtilities.safeAreaInsets(for: parentView ?? UIApplication.shared.keyWindow)

        switch bannerPosition {
        case .top:
            return safeAreaInsets.top
        case .bottom:
            return safeAreaInsets.bottom
        @unknown default:
            return 0
        }
    }

    /// Safe area insets of the view
    /// - parameters:
    ///     - view: the view from which these isents should be taken
    class func safeAreaInsets(for view: UIView?) -> UIEdgeInsets {
        // No safe area before ios 11 -> insets .zero
        guard #available(iOS 11, *) else {
            return .zero
        }

        // No view -> insets .zero
        guard let view = view else {
            return .zero
        }

        return view.safeAreaInsets
    }
}
