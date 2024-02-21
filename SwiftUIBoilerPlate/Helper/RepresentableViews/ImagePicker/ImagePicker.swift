//
//  ImagePicker.swift
//  Squeezee SwiftUI
//
//  Created by AKASH on 12/08/23.
//

import SwiftUI
import UIKit

// MARK: - ImagePicker
struct ImagePicker: UIViewControllerRepresentable {
    // MARK: - Properties
    let sourceType: UIImagePickerController.SourceType
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?

    // MARK: - Functions
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagepicker = UIImagePickerController()
        imagepicker.sourceType = sourceType
        imagepicker.allowsEditing = false
        imagepicker.delegate = context.coordinator
        return imagepicker
    }

    func updateUIViewController(_: UIViewControllerType, context _: Context) {}

    func makeCoordinator() -> Coordinater {
        Coordinater(parent: self)
    }
}

// MARK: - Coordinater

// MARK: - Coordinater
class Coordinater: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properties
    var parent: ImagePicker

    // MARK: - Life Cycle
    init(parent: ImagePicker) {
        self.parent = parent
    }

    // MARK: - Functions
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        parent.selectedImage = image
        parent.presentationMode.wrappedValue.dismiss()
    }

    func imagePickerControllerDidCancel(_: UIImagePickerController) {
        parent.presentationMode.wrappedValue.dismiss()
    }
}
