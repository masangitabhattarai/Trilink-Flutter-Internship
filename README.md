# Flutter Internship Assignment — May 2026 Batch
### Trilink IT Solution Pvt Ltd

A complete Flutter application demonstrating UI design, form validation, REST API integration, and state management.

---

## 📱 Screens Overview

### 🏠 Home Screen
- A clean navigation hub with cards for each task
- Tapping any card navigates to that task's screen

### ✅ Task 1 — Profile Page Design
- Closely replicates the provided Profile UI
- Circular avatar with edit icon overlay
- **Personal Info** card: Name, Email, Phone, Address
- **Account Info** card: Member since, Status, Subscription
- Bottom navigation bar (Home, Map, Transfer, Settings, Profile)
- Logout button

### 🔐 Task 2 — Login Page
- Matches the provided "EDUCA APP" login UI (both empty and filled states)
- **Email validation**: checks format using RegExp
- **Password validation**: must be more than 8 characters
- Password visibility toggle
- Loading indicator during fake authentication
- On success: shows an `AlertDialog` with a success message

### 🌐 Task 3 — API Integration
- Fetches data from `https://jsonplaceholder.typicode.com/posts`
- Displays results in a `ListView` with styled post cards
- Shows a `CircularProgressIndicator` while loading
- Handles errors (network failure, server errors) with a retry button
- Pull-to-refresh via AppBar icon

### 📝 Task 4 — To-Do CRUD App
- Built with **Provider** state management
- **Create**: Add tasks with title + optional description via a dialog
- **Read**: Tabs for Pending and Completed tasks with a progress bar
- **Update**: Edit any task's title and description
- **Delete**: Delete individual tasks or clear all completed at once
- **Toggle**: Mark tasks complete/incomplete with animated checkboxes
- Confirmation dialogs before deletion

---

## 🛠 Tech Stack

| Concern | Package |
|---|---|
| State Management | `provider ^6.1.1` |
| HTTP Requests | `http ^1.2.0` |
| UI | Flutter Material 3 |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.0.0
- Dart SDK ≥ 3.0.0

## 🎨 Design Choices

- **Color palette**: Primary `#4361EE` (blue), accent `#06D6A0` (teal), `#3ABEF9` (sky), `#7209B7` (violet)
- **Material 3** theming with consistent border radii (12–16px)
- Cards with subtle shadows for depth
- Smooth `AnimatedContainer` for todo checkboxes
- `TabController` for pending/completed separation in the todo screen

---

## 📋 Assignment Requirements Checklist

- [x] Home page with Column of navigation buttons
- [x] Task 1: Profile page with avatar, personal info, account info, bottom nav
- [x] Task 2: Login page with email + password validation and success dialog
- [x] Task 3: API integration with ListView, loading indicator, error handling
- [x] Task 4: To-Do CRUD — view, add, edit, delete, complete tasks with Provider

---

*© Trilink IT Solution Pvt Ltd — https://trilinkitsolution.com.np*

screenshort of task
task 
<img width="328" height="681" alt="image" src="https://github.com/user-attachments/assets/3104ef21-9f8d-4eb6-a1f2-e820a90c3b2b" />
task 1
<img width="327" height="697" alt="image" src="https://github.com/user-attachments/assets/6efb63b1-e4ae-4fc8-b5ed-ba1726432cb4" />
task 2
<img width="319" height="647" alt="image" src="https://github.com/user-attachments/assets/19f7b246-38bd-484b-b706-3205e35f1045" />
task 3
<img width="326" height="689" alt="image" src="https://github.com/user-attachments/assets/9a028010-dca4-426d-9c81-3bdca47a5629" />
task 4

<img width="333" height="699" alt="image" src="https://github.com/user-attachments/assets/5c7df9d1-abef-4bd7-93e5-b852aaa948e2" />


## 📱 Download APK
You can download the compiled APK to test the application directly on your device:
- [Download App APK](https://drive.google.com/file/d/17M549JXSI8SdcmVbhZ23DYzAHuoMUDZe/view?usp=sharing)




