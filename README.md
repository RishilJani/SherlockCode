# 🔐 SherlockCode (Cipher-Decoder)

A Flutter-based mobile application for **encoding/decoding** and **encryption/decryption** of text using classical and modern methods.  
This project is designed as a handy tool for students, developers, and security enthusiasts to experiment with data transformation techniques in an intuitive UI.

---

## ✨ Features

- 🔒 **Encrypt & Decrypt**
  - Classical ciphers (Caesar, Playfair, Atbash , Railfence)
  - Modern encryption methods (Future plan)  
- 📱 **User-Friendly Interface**
  - Dashboard with quick navigation
  - Dark theme friendly design  
- ℹ️ **About Section**
  - Learn more about the app and its purpose
- 📮 **Feedback Screen**
  - A built-in feedback form/screen allowing users to submit issues, suggestions or contact details directly from the app. (Included in the app source; see Project Structure below.)

---

## 📂 Project Structure (high-level)

```
lib/
 ├── main.dart                      # Entry point
 ├── dashboard/                     # Main dashboard + splash screen
 ├── encrypt_decrypt/               # Encryption/Decryption features
 ├── about_us/                      # About Us page
 ├── feedback/                      # Feedback screen & related controllers/views
 └── ...                            # other modules and utilities
```

---

## 📮 Feedback Screen (in README)

The app includes a **Feedback** screen where users can submit comments, bug reports, or contact info without leaving the app. This is useful for collecting user input during testing and early releases.

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (≥ 3.0.0)  
- Android Studio / VS Code with Flutter & Dart plugins

### Installation
```bash
# Clone the repository
git clone https://github.com/RishilJani/Cipher-Decoder.git

# Navigate into the project
cd Cipher-Decoder

# Get dependencies
flutter pub get

# Run on a connected device
flutter run
```

---

## 🛠️ Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **State Management:** GetX 
- **Design:** Material Design, custom splash screen  

---

## 🔮 Future Enhancements

* Asymetric cryptography
* Hash and MAC Algorithms
* in-build chat section

---

## 🤝 Contributing

Contributions are welcome!  
- Fork the repo  
- Create a new branch (`feature/my-feature`)  
- Commit changes  
- Open a Pull Request  

When contributing, please include any UI screenshots for new screens like the Feedback screen so reviewers can see the UX changes quickly.

---
