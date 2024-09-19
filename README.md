<div align="center">
	<h1>🚀 Activate MacOS App</h1>
	<img src="https://img.shields.io/badge/swift-%23007ACC.svg?style=for-the-badge&logo=swift&logoColor=white"/>
	<img src="https://img.shields.io/badge/License-AGPL_v3-blue.svg?style=for-the-badge"/>
</div>

<br />

> Version: **1.0.0**

---

Welcome to the **Activate MacOS** app! 🎉 This fun little app is designed to mimic the activation message you might see on Windows when you don't have a valid license. A playful nod to our friends using Windows!

# 🎯 Purpose

This app creates a window on your macOS desktop with a message that says: 

- **"Activate MacOS"** 
- **"Go to Settings to activate MacOS."**

It's a humorous way to remind you of the activation screens found in other operating systems. 😉

# 🚀 Getting Started

## Launching the App

1. **Run the App**: 
   - Simply build and run the app using Xcode or use prebuilt DMG. The window will appear on your screen with the activation message.
   
2. **Enjoy the View**: 
   - You should see a small, borderless window in the bottom-right corner of your screen displaying the activation message.

## Stopping the App

1. **Open Terminal**:
   - Launch the Terminal app from your Applications folder or search for it using Spotlight.

2. **Find the Process ID**:
   - Use the following command to find the process ID (PID) of the app:
     ```bash
     ps aux | grep ActivateApp
     ```
   - Note the PID of the `ActivateApp` process.

3. **Kill the Process**:
   - Execute the following command to stop the app:
     ```bash
     kill -9 <PID>
     ```
   - Replace `<PID>` with the actual process ID you found earlier.

# ✨ Features

- **Borderless Window**: The app features a borderless window that blends seamlessly with your desktop.
- **No Window Buttons**: All standard window buttons (minimize, zoom, close) are hidden to keep it sleek.
- **Floating Window**: The window stays above other windows, ensuring you don't miss it!

# 📸 Screenshot

<div align="center">
	<img src="assets/screenshot.png" width="500"/>
</div>

# 🤔 Troubleshooting

- **Window Not Appearing**: Ensure you run the app from Xcode or use the prebuilt DMG. If the window doesn't appear, try restarting the app.
- **Can't Kill the Process**: Make sure you're using the correct PID and have the necessary permissions in Terminal.

# 📧 Contact

If you have any questions or feedback, feel free to reach out!

---

Enjoy your playful activation message! 😄
