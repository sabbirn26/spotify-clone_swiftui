# 🎵 Spotify Clone

A sleek and modern Spotify Clone built using **SwiftUI**, **SwiftfulUI**, and **SwiftfulRouting**. This project showcases a dynamic music streaming interface with features such as playlists, categories, and product-based music browsing.

---

Screenshots 📱
<table>
  <tr>
    <td align="center">
      <img src="/screenshots/home.png" width="250" alt="Home View"/><br/>
      <em>Home View</em>
    </td>
    <td align="center">
      <img src="/screenshots/playlist.png" width="250" alt="Playlist View"/><br/>
      <em>Playlist View</em>
    </td>
<!--     <td align="center">
      <img src="/screenshots/details.png" width="250" alt="Details Screen"/><br/>
      <em>Details Screen</em>
    </td> -->
  </tr>
  </tr>
</table>

---

## 🚀 Features

- 🎨 **Modern UI** with a Spotify-inspired design.
- 📌 **Categories & Playlists** to explore different music sections.
- 🏷 **Product-Based Browsing** powered by `dummyjson.com` API.
- 📜 **LazyVStack & Scrollable Sections** for seamless navigation.
- 📷 **Dynamic Image Loading** using `SDWebImageSwiftUI`.
- 🛠 **MVVM Architecture** for better scalability.
- 🚀 **SwiftfulRouting** for smooth screen transitions.

---

## 📦 Dependencies

This project uses the following libraries:

- [SwiftfulUI](https://github.com/swiftful-thinking/SwiftfulUI)
- [SwiftfulRouting](https://github.com/swiftful-thinking/SwiftfulRouting)
- [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)

To install dependencies, ensure you have **Swift Package Manager (SPM)** configured.

---

## 🔧 Setup & Installation

1️⃣ Clone the repository:
```bash
 git clone https://github.com/sabbirn26/SpotifySwiftUI.git
```

2️⃣ Navigate to the project folder:
```bash
cd SpotifySwiftUI
```

3️⃣ Open the project in Xcode:
```bash
open SpotifySwiftUI.xcodeproj
```

4️⃣ Build & Run the app on a simulator or device 🎉

---

## 📁 Project Structure

```
SpotifySwiftUI/
│── Models/          # Data models (User, Product, etc.)
│── Core/           # SwiftUI View files
│── Sharted/         # Utility functions and extensions
│── Components/       # Assets, Constants, Reusables cells and more
│── README.md        # This file 😃
```

---

## 🌍 API Integration

The app fetches data from **dummyjson.com** APIs:

- Products: `https://dummyjson.com/products`
- Users: `https://dummyjson.com/users`

Data is fetched asynchronously using `DatabaseHelper.swift`.

---

## 📌 Future Improvements

- 🎵 **Real Music Playback** with AVFoundation.
- 🔍 **Search Functionality** for songs and playlists.
- 🔥 **Firebase Authentication** for user login.
- 🎨 **Only Dark & Light Mode Support**.

---

## 🛠 Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a feature branch (`feature-name`).
3. Commit your changes.
4. Push to your branch and create a Pull Request.

---

## 📜 License

This project is **open-source** and available under the **MIT License**.

---

## 📬 Contact

📧 Email: [nsabbir26@gmail.com](mailto:nsabbir26@gmail.com)

🔗 LinkedIn: [Your LinkedIn Profile](https://github.com/sabbirn26)

🔥 Feel free to reach out for collaborations!

---

⭐ **If you like this project, don't forget to star the repo!** ⭐


