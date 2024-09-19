// MARK: IMPORTS
import SwiftUI

// MARK: - MainView
/// A SwiftUI view that displays activation instructions for macOS.
struct MainView: View {
  var body: some View {
    // Vertical stack of text elements
    VStack(alignment: .leading) {
      // Title text with styling
      Text("Activate MacOS")
        .font(.title2) // Set font size and weight
        .foregroundStyle(.gray) // Set text color to gray
        .padding(.bottom, 5) // Add padding below the text
      
      // Instruction text with styling
      Text("Go to Settings to activate MacOS.")
        .foregroundStyle(.gray) // Set text color to gray
    }
    // Set fixed size and alignment for the VStack
    .frame(width: 220, height: 50, alignment: .leading)
  }
}
