# BipTheGuy

Hello there, iOS folks and photo-punching enthusiasts! Welcome to *BipTheGuy*—a fun, interactive iOS application built on SwiftUI that lets you add a unique twist to your favorite photos. Presented with a photo, you can just tap on it to virtually 'punch' it! Also, don't miss out on the option that allows you to upload your own pictures right from your device's image gallery.

Are you ready to add a dash of excitement to your images? Great! Let's get started.

## Project Overview

*BipTheGuy* employs SwiftUI to build its user interface and utilizes AVFAudio to integrate sound effects. PhotosUI is used to access the image gallery of the user's device.

## Features

1. **'Punch' an Image:** A tap on the image shrinks it to 90% of its size, giving the effect of a 'punch'. A sound accompanies each 'punch' to provide a more engaging experience.

2. **Image Picker:** Upload your own photos to the app using the built-in image picker.

3. **Sound Effects:** 'Punching' an image produces a realistic sound effect.

## Installation

1. Clone or download the project to your local machine.
2. Open the project in Xcode.
3. Run the project in the iOS Simulator or on your device.

## Usage

```swift
// Load the image that you want to 'punch'
var bipImage = Image("clown")

// Tap the image to 'punch' it
bipImage
  .resizable()
  .scaledToFit()
  .scaleEffect(animateImage ? 1.0 : 0.9)
  .onTapGesture {
      playSound(soundName: "punchSound")
      animateImage = false 
      withAnimation (.spring(response: 0.3, dampingFraction: 0.3)) {
          animateImage = true
      }
  }

// Click the "Photo Library" button to select a photo from your gallery
PhotosPicker(selection: $selectedItem, matching: .images, preferredItemEncoding: .automatic) {
  Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
}
```

## Contributing

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

Thanks for stopping by! Enjoy *BipTheGuy* and happy 'punching'! 💪😄

## Acknowledgments

A big shout-out to [Dani Benet](https://github.com/DaniBenet) for creating this awesome project.

## License

*BipTheGuy* is available under the MIT license. See the LICENSE file for more info.
