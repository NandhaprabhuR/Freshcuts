# 🥩 Freshcuts - Meat Ordering App


Freshcuts is a Flutter-based mobile application for ordering meat and fish from nearby stores with real-time location tracking. It is powered by Firebase for backend services and integrates mapping features using Flutter Map.



## 📲 Features

### 👤 Customer
- 🔐 Login & Registration
- 📍 View nearby shops using map (Flutter Map)
- 🛒 Place orders (Delivery / Self Pickup)
- ✅ Cancel orders
- 🌟 Rate & review shops

### 🚚 Delivery Person
- 🔐 Login with role verification
- 📦 Manage assigned deliveries
- 🧭 Navigate to customer/shop using directions
- 📨 Receive notifications for new delivery assignments



## 🛠 Tech Stack

| Layer         | Technology     |
|---------------|----------------|
| UI            | Flutter        |
| State Mgmt    | Provider / SetState |
| Auth & Backend| Firebase Auth, Firestore, Cloud Functions |
| Location      | Flutter Map (OpenStreetMap) |
| File Mgmt     | Firebase Storage |
| Deployment    | Android Studio |



🌍 Nearby Shop Discovery
Location permissions required.

Shops are shown as markers on the map.

Clicking on a marker opens shop details and route directions.

📦 Firebase Services Used
🔐 Firebase Authentication

🗂 Firestore Database

🧭 Firebase Cloud Functions (for role-based access, if used)

☁️ Firebase Storage (for shop images, reviews)



💡 Future Improvements
🧠 Add LLM for smart ordering help

💳 Razorpay/Stripe integration

🔔 Push Notifications


