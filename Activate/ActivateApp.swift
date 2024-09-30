// MARK: IMPORTS
import SwiftUI

// MARK: - FUNCTIONS

// Set Up Window Function
/// Configures the window's appearance and behavior.
private func setUpWindow() {
  DispatchQueue.main.async {
    // Access the first window of the application
    if let window = NSApplication.shared.windows.first {
      // Make the window background clear and remove its opacity
      window.backgroundColor = NSColor.clear
      window.isOpaque = false
      
      // Set the window level to floating and enable specific collection behaviors
      window.level = .floating
      window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
      
      // Remove the window shadow and make the title bar transparent
      window.hasShadow = false
      window.titlebarAppearsTransparent = true
      
      // Set the window style to borderless and prevent window movement
      window.styleMask = [.borderless]
      window.isMovable = false
      
      // Hide standard window buttons
      window.standardWindowButton(.zoomButton)?.isHidden = true
      window.standardWindowButton(.miniaturizeButton)?.isHidden = true
      window.standardWindowButton(.closeButton)?.isHidden = true
      
      // Configure window size and position based on the screen's visible frame
      if let screen = window.screen {
        let screenRect = screen.visibleFrame
        
        let windowWidth: CGFloat = 220
        let windowHeight: CGFloat = 50
        
        // Calculate window position (bottom-right corner with padding)
        let windowX = (screenRect.maxX - windowWidth) - 30
        let windowY = screenRect.minY + 30
        
        // Set the new frame for the window
        let newFrame = NSRect(x: windowX, y: windowY, width: windowWidth, height: windowHeight)
        window.setFrame(newFrame, display: true, animate: false)
      }
    }
  }
}

// MARK: - VIEWS

// Right Click View
/// A custom NSView that detects right-click events.
struct RightClickView: NSViewRepresentable {
  class Coordinator: NSObject {
    @objc func handleRightClick(_ event: NSEvent) {
      // Check if the right mouse button was clicked
      if event.type == .rightMouseDown {
        // Create a menu
        let menu = NSMenu()
        
        // Add "Quit App" option
        let quitMenuItem = NSMenuItem(title: "Quit App", action: #selector(quitApp), keyEquivalent: "q")
        quitMenuItem.target = self
        
        menu.addItem(quitMenuItem)
        
        // Show the menu at the mouse location
        NSMenu.popUpContextMenu(menu, with: event, for: event.window?.contentView ?? NSView())
      }
    }
    
    // Quit the application
    @objc func quitApp() {
      NSApplication.shared.terminate(nil)
    }
  }
  
  // Create a coordinator instance
  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
  
  // Create an NSView instance
  func makeNSView(context: Context) -> NSView {
    let view = NSView()
    
    // Add right-click event monitoring to the view
    NSEvent.addLocalMonitorForEvents(matching: [.rightMouseDown]) { event in
      context.coordinator.handleRightClick(event)
      return event
    }
    
    return view
  }
  
  // Update the NSView if needed
  func updateNSView(_ nsView: NSView, context: Context) {
  }
}

// MARK: - MAIN
@main
struct ActivateApp: App {
  // State variable to hold a reference to the window
  @State private var window: NSWindow?
  
  var body: some Scene {
    WindowGroup {
      MainView()
        .fixedSize() // Prevent ContentView from resizing
        .ignoresSafeArea() // Allow ContentView to extend beyond safe areas
        .onAppear {
          setUpWindow() // Configure the window setup on appearance
        }
        .background(RightClickView()) // Add right-click detection
    }
    .windowStyle(.hiddenTitleBar) // Apply hidden title bar style to the window
    .windowResizability(.contentSize) // Restrict window resizing to content size
  }
}
