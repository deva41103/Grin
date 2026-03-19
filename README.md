# Flutter Machine Test Assignment

## Objective
Develop a Flutter application that demonstrates API integration, pagination, clean architecture (MVC + Repository), and Firebase Authentication.

## Architecture: MVC + Repository Pattern
- **Models**: Defines the data structures (e.g., `User`).
- **Views**: The UI layer (e.g., `LoginView`, `HomeView`).
- **Controllers (Providers)**: Manages state and interacts with repositories (`AuthController`, `UserController`).
- **Repositories**: Acts as a bridge between the Controller and Services (`AuthRepository`, `UserRepository`).
- **Services**: Handles direct API calls and Firebase Auth calls (`ApiService`, `AuthService`).

## Features
- **Firebase Authentication**: Email and Password login/signup.
- **Paginated User List**: Loads 5 users per page from ReqRes API.
- **Infinite Scrolling**: Fetches the next page when reaching the bottom.
- **Pull to Refresh**: Refreshes the user list from the first page.
- **Loader**: Visual feedback during API calls.
- **Session Management**: Automatically redirects to Home if already logged in.

## Setup Instructions
1.  Ensure you have Flutter installed.
2.  The `.env` file is already created at `assets/creds/.env` with the necessary Firebase credentials.
3.  Run `flutter pub get` to install dependencies.
4.  Run the application using `flutter run`.

## Technologies Used
- Flutter / Dart
- Provider (State Management)
- HTTP (Networking)
- Firebase Auth (Authentication)
- Cached Network Image (Image Loading)
- Flutter Dotenv (Environment Variables)
