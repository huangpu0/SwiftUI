//
//  K_04_Image.swift
//  SwiftUIDemo
//
//  Created by ycwh on 2024/12/17.
//

import SwiftUI

struct K_04_Image: View {
    
    @State private var uiImage: UIImage? = nil
    let placeholderImage = UIImage(named: "icon_勾选")!
    
    private var urlImage: Image? = nil

    
    var body: some View {
        
        Text("UIImage+ImageResource")
        if let uiimage = UIImage(named: "icon_勾选") {
            HStack {
                Image(uiImage: uiimage)
                Image(ImageResource.icon勾选)
            }
        }
        
        Text("BunldImage")
        if let resBundlePath = Bundle.main.path(forResource: "K_04", ofType: "bundle"),
           let resBundle = Bundle(path: resBundlePath),
           let uiImage = UIImage(named: "icon_设置", in: resBundle, with: nil) {
            Image(uiImage: uiImage)
        }
        
        Text("网络图片+切圆角")
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .onAppear(perform:
                        downloadWebImage
            )
            .frame(width: 80,
                   height: 80,
                   alignment: .center)
            .onTapGesture {
                print("Tap ")
            }.clipShape(Circle())
            .overlay {
                RoundedRectangle(cornerRadius: 40, style: .circular).stroke(.red, lineWidth: 3)
            }
        
        Text("AsyncImage+URL方式加载网络")
        if let url = URL(string: "https://picsum.photos/50/50?i=30") {
            AsyncImage(url: url) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
            } placeholder: {
                Image.init(.icon勾选)
            }
            
        }
        

        
        
        
        
    }
    
    func downloadWebImage() {
        
        guard let url = URL(string: "https://picsum.photos/50/50?i=30") else {
            print("Invalid URL.")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            }else {
                print("error: \(String(describing: error))")
            }
        }.resume()
    }
}

#Preview {
    K_04_Image()
}
