//
//  ScanView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import SwiftUI
import PhotosUI

struct ScanView: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var image: UIImage?
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.black)
            
            VStack {
                if let selectedImage{
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                }
                
                Button("Open camera") {
                    self.showCamera.toggle()
                }
                .fullScreenCover(isPresented: self.$showCamera) {
                    accessCameraView(selectedImage: self.$selectedImage)
                }
            }
        }
    }
}

struct accessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

#Preview {
    ScanView()
}
