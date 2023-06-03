//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Dani Benet on 3/6/23.
//

import SwiftUI
import AVFAudio
import PhotosUI

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var animateImage = true
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var bipImage = Image("clown")
    
    var body: some View {
        VStack {
            
            Spacer()
            
            bipImage
                .resizable()
                .scaledToFit()
                .scaleEffect(animateImage ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    animateImage = false // will immediately shring to 90% of it's size
                    
                    withAnimation (.spring(response: 0.3, dampingFraction: 0.3)) {
                        animateImage = true
                    }
                }
            
            
            Spacer()
            
            PhotosPicker(selection: $selectedItem, matching: .images, preferredItemEncoding: .automatic) {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                        if let uiImage = UIImage(data: selectedImageData!) {
                            bipImage = Image(uiImage: uiImage)
                        }
                    }
                }
            }
            
        }
        .padding()
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
