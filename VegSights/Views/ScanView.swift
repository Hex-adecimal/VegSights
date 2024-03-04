//
//  ScanView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import SwiftUI
import PhotosUI
import Vision
/*
 struct ScanView: View {
 @State private var showCamera = false
 @State private var selectedImage: UIImage?
 @State var image: UIImage?
 
 func recognizeTextHandler(request: VNRequest, error: Error?) {
 guard let observations =
 request.results as? [VNRecognizedTextObservation] else {
 return
 }
 let recognizedStrings = observations.compactMap { observation in
 // Return the string of the top VNRecognizedText instance.
 return observation.topCandidates(1).first?.string
 }
 
 // Process the recognized strings.
 print(recognizedStrings)
 }
 
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
 
 // Get the CGImage on which to perform requests.
 guard let cgImage = selectedImage?.cgImage else { return }
 
 
 // Create a new image-request handler.
 let requestHandler = VNImageRequestHandler(cgImage: cgImage)
 
 
 // Create a new request to recognize text.
 let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)
 // request.recognitionLevel = .fast
 
 do {
 // Perform the text-recognition request.
 try requestHandler.perform([request])
 } catch {
 print("Unable to perform the requests: \(error).")
 }
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
 */

struct ScanView: View {
    @EnvironmentObject var vm: AppViewModel
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .notDetermined:
            Text("notDetermined")
        case .cameraAccessNotGranted:
            Text("cameraAccessNotGranted")
        case .cameraNotAvailable:
            Text("cameraNotAvailable")
        case .scannerAvailable:
            mainView
        case .scannerNotAvailable:
            Text("scannerNotAvailable")
        }
    }
    
    private func isVegan(_ inputString: String) -> Bool{
        let meatKeywords = ["meat", "beef", "pork", "chicken", "lamb", "fish", /* add more if needed */]

            let lowercasedString = inputString.lowercased()
            let words = lowercasedString.components(separatedBy: CharacterSet.whitespacesAndNewlines)

            for word in words {
                for keyword in meatKeywords {
                    if word.contains(keyword) {
                        return true
                    }
                }
            }

            return false
        }
    
    private var mainView: some View {
        VStack {
            DataScannerView(
                recognizedItems: $vm.recognizedItem,
                recognizedDataType: vm.recognizedDataType,
                recognizesMultipleItems: vm.recognizedMultipleItems)
            ScrollView {
                ForEach(vm.recognizedItem) { item in
                    switch item {
                    case .text(let text):
                        Text(text.transcript)
                            .foregroundStyle(isVegan(text.transcript) ? .red : .green)
                        
                    case .barcode(let barcode):
                        Text (barcode.payloadStringValue ?? "Unknown barcode")
                    @unknown default:
                        Text("Unknown")
                    }
                
                }
            }
        }
        
    }
}

#Preview {
    ScanView()
}
