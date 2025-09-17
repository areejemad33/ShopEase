# ShopEase 🛍️

## Project Overview
ShopEase is a Flutter-based shopping application that allows users to browse and purchase sneakers, jackets, and other products. The app features special hot offers, a personalized favorites list, a cart system, quantity management, and user profile management. It provides a smooth and localized experience in both English and Arabic.

---

## Features
- **Onboarding page** for new users
- **User authentication:** Signup & Login
- **Favorites** per user
- **Cart** per user
- **Checkout functionality**
- **Orders page** per user
- **Hot offers section**
- **Save logged-in users** using Shared Preferences
- **Product details** including:
  - Name
  - Price
  - Size
  - Quantity
  - Category
  - Image
  - Description
- **Profile management:**
  - Upload profile image
  - Edit username
  - Edit password
- **Quantity management**
- **Drawer Features:**
  - Displays user information (name, email, profile image) from Shared Preferences
  - Navigation links:
    - Home
    - Favorites
    - Profile
  - Additional pages:
    - About Us (scrollable content)
    - Contact Us
    - Settings page
    - Help / FAQ section
  - Logout button clears navigation stack and redirects to Login page
  - Supports **localization** (Arabic & English) using `S.of(context)`
  - Icons and colors for each drawer item for better UX
- **Data models** for Users and Products
- **Localization support** (Arabic & English)
- **Clean UI and smooth animations

---

## Technologies & Packages Used
- **Flutter (Dart)**
- **Shared Preferences (^2.3.2)** – for local storage
- **Provider (^6.1.5+1)** – state management
- **flutter_slidable (^3.0.0)** – for swipeable list items
- **image_picker (^1.2.0)** – for uploading images
- **animated_text_kit (^4.2.3)** – for animated text effects
- **flutter_intl** – for localization (Arabic & English support)
- **Custom font:** Suwannaphum

---

## Setup Instructions
1. **Clone the repository:**
   ```bash
   git clone https://github.com/areejemad33/ShopEase.git

2. **Navigate to the project directory:**
  cd shopping_application
3. **Get dependencies:**
  flutter pub get
4. **Run the app:**
  flutter run 




## screenshoots:
Check the `screenshots` folder in this repository for app screenshots.



## Notes: 

 Make sure your Flutter environment is set up.

 The app supports both Arabic and English; you can switch languages in the settings page.

 User data is stored locally using Shared Preferences; no backend server is required.

