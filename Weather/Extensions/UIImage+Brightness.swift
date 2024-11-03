//
//  UIImage+Brightness.swift
//  Weather
//
//  Created by Dhanya Kini on 05/08/23.
//


import UIKit
import CoreImage

extension UIImage {
    func averageBrightness() -> CGFloat {
        guard let cgImage = self.cgImage else { return 0.5 }

        let ciImage = CIImage(cgImage: cgImage)
        let extentVector = CIVector(x: ciImage.extent.origin.x, y: ciImage.extent.origin.y, z: ciImage.extent.size.width, w: ciImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: ciImage, kCIInputExtentKey: extentVector]) else { return 0.5 }
        guard let outputImage = filter.outputImage else { return 0.5 }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        let brightness = (0.299 * CGFloat(bitmap[0]) + 0.587 * CGFloat(bitmap[1]) + 0.114 * CGFloat(bitmap[2])) / 255
        return brightness
    }
}
