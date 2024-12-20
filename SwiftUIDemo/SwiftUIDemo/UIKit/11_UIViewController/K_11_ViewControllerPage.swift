//
//  PushSwiftViewController.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/19.
//

import SwiftUI

struct K_11_ViewControllerPage: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = K_11_ViewController()
        vc.sss = {
            presentationMode.wrappedValue.dismiss()
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}


struct UIViewControllerRepresentableDemo1: View {
  @State private var isShow: Bool = false
  @State var image: UIImage?

  var body: some View {
    VStack {
      if let image {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 300, height: 200)
          .clipped()
      }

      Button(action: {
        isShow = true
      }, label: {
        Text("Show image picker")
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .clipShape(Capsule())
      })
      .sheet(isPresented: $isShow) {
        ImagePickerViewControllerRepresentable(isShow: $isShow, image: $image)
    }
    }
  }
}

struct ImagePickerViewControllerRepresentable: UIViewControllerRepresentable {
  @Binding var isShow: Bool
  @Binding var image: UIImage?

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let imagePicker = UIImagePickerController()
    imagePicker.allowsEditing = false
    imagePicker.delegate = context.coordinator
    return imagePicker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

  }

  func makeCoordinator() -> Coordinator {
    Coordinator(isShow: $isShow, image: $image)
  }

  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @Binding var isShow: Bool
    @Binding var image: UIImage?

    init(isShow: Binding<Bool>, image: Binding<UIImage?>) {
      self._isShow = isShow
      self._image = image
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      guard let newImage = info[.originalImage] as? UIImage else { return }
      image = newImage
      isShow = false
    }

  }
}
