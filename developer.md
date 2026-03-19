# Developer Documentation & Interview Guide

This document is designed to help you understand and explain the **Grin** project architecture, technical decisions, and features during an interview.

## 1. Project Overview
**Grin** is a Flutter-based mobile application that demonstrates modern development practices. It features a secure authentication system using **Firebase** and a paginated user list fetched from a **REST API (ReqRes)**.

## 2. Architecture: MVC + Repository Pattern
The project follows a modified **MVC (Model-View-Controller)** pattern combined with a **Repository** layer for clean separation of concerns.

-   **Model**: Defines the data structure. (e.g., `User` model)
-   **View**: The UI layer built with Flutter widgets. (e.g., `HomeView`, `LoginView`)
-   **Controller (Provider)**: Manages application state and business logic using the **Provider** package. It acts as the bridge between the UI and the Data layer.
-   **Repository**: Decouples the data sources from the business logic. It handles data fetching and transformation, allowing the controllers to be agnostic of whether the data comes from an API, a local database, or a cache.
-   **Service**: Contains the raw implementation for external communications (e.g., `ApiService` for HTTP, `AuthService` for Firebase).

## 3. Folder Structure
-   `lib/models/`: Data classes and JSON serialization.
-   `lib/views/`: UI screens and components.
-   `lib/controllers/`: State management logic (Providers).
-   `lib/repositories/`: Business logic for data operations.
-   `lib/services/`: Direct wrappers for external APIs and Firebase.
-   `assets/creds/`: Configuration files (e.g., `.env`).

## 4. Key Features & Implementation
### **Firebase Authentication**
-   **Mechanism**: Implements Email/Password sign-up and login.
-   **Session Management**: Uses `authStateChanges()` stream to automatically redirect users to either the Login or Home screen upon app startup (managed in `SplashView`).

### **Paginated User List**
-   **API**: Fetches data from `https://reqres.in/api/users`.
-   **Pagination Logic**: Uses `page` and `per_page` query parameters.
-   **Infinite Scroll**: A `ScrollController` in `HomeView` listens for scroll position. When reaching near the bottom, it triggers the `UserController` to fetch the next page.
-   **State Loop**: `Controller` sets `isLoading = true` -> `notifyListeners()` -> `Repository` fetches data -> `Model` parses JSON -> `Controller` appends data -> `isLoading = false` -> `notifyListeners()` -> UI updates.

### **Pull to Refresh**
-   Integrated `RefreshIndicator` in `HomeView`, which resets the `currentPage` to 1 and clears the existing list before fetching fresh data.

## 5. Technology Stack
-   **Framework**: Flutter (Dart)
-   **State Management**: Provider
-   **Backend/Auth**: Firebase Core & Firebase Auth
-   **Networking**: HTTP package
-   **Image Loading**: CachedNetworkImage (for performance and offline support)
-   **Security**: Flutter Dotenv (to hide sensitive API keys)

## 6. Interview "Key Points" to Mention
1.  **Clean Code**: "I used the Repository pattern to ensure that the controllers don't need to know where the data comes from. This makes the code highly testable and maintainable."
2.  **Scalability**: "The architecture is designed to handle more features. New API modules or authentication methods can be added without affecting existing UI or state logic."
3.  **Performance**: "I implemented image caching (CachedNetworkImage) to reduce bandwidth and improve the user experience on slow networks."
4.  **Security**: "I used environment variables (.env) and Git ignore rules to ensure sensitive Firebase credentials are never exposed in public repositories."
5.  **User Experience**: "I focused on a 'Premium' look by using modern design principles, custom headers, and cards instead of plain list tiles."
