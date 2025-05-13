# EcoMap - Environmental Waste Management and Tracking System

A web-based platform for efficient waste management and community coordination.

## Features

### 1. Educational Resources
- User View: Displays admin-uploaded files only, grouped by category (Guides, Presentations, Videos).
- Modern UI: Tabs, search bar, filterable cards, modals for long descriptions.
- Thumbnails: Custom images or default icons.
- Consistent card height and alignment.
- Admin View: Upload files (PDF, PPT, MP4, YouTube links) and select category.
- Table of all materials with Edit/Delete, thumbnails, search, and category tabs.

### 2. User, Driver, and Admin Management
- Admin Dashboard: Stats cards for users, drivers, educational materials.
- Responsive, modern card layout.
- Analytics: Line and pie charts (Chart.js).
- Tabs for Community Users, Drivers, Admins with searchable/filterable tables.
- Delete buttons for all user types.

### 3. Profile Management
- All users have a profile page to view/edit username, email, nickname, and change password.
- Profile picture upload; gender-based default avatars.

### 4. Registration & Login
- Registration form: username, nickname, email, password, role, gender.
- Nickname for display, username for login.

### 5. Waste Pickup Schedule
- Modern, centered search bar styled to match education page.
- Responsive schedule display.
- Admins/drivers can add new schedules via a form.
- Interactive calendar view (FullCalendar) with events from backend.
- Events show time and area; dayMaxEvents for overflow.
- List and calendar views with styled tabs.
- Time frames (start/end time) for pickups.
- Improved time picker with AM/PM support.

### 6. Pickup Points
- Admins: Add, edit, delete pickup points; map integration for location selection.
- Users/drivers: View pickup points on map and in table.
- Only active points shown by default; toggle for inactive points.
- Inactive points: gray markers/rows; active: blue markers.
- Long descriptions truncated with "see more" modal.
- Map restricted to Batangas City bounds.
- Address/description is a textarea (no schedule field).

### 7. Ecobot (AI Chatbot)
- Modern chat UI for users to interact with an AI assistant.
- Backend PHP endpoint connects to OpenAI's ChatGPT API (or other providers).
- Ready for use with valid API credits.

### 8. Life360 Integration
- Life360 page with instructions and join code/link.
- Drivers: Must join, set name to start with "Driver", and hide location after work.
- Users: May join, must set name to start with "User", and should hide location for privacy.
- Admins: Can edit code/link (stored in `settings` table).
- Admins will remove anyone not following naming conventions.
- Clear privacy and participation instructions for all roles.

### 9. Navigation & Layout
- Navbar: Shows admin links only for admins. Profile picture handling. Modern design, links for Home, Schedule, Education, Pick up points, Ecobot, Life360.
- Footer: Static at the bottom, modern and informative.

### 10. UI/UX & General Improvements
- Consistent styling for tabs, buttons, and cards.
- Responsive design for all components.
- Error handling for file uploads and user actions.
- Improved alignment and spacing for forms and pickers.
- Custom CSS for FullCalendar and time picker dropdowns.

## Tech Stack

- Frontend: HTML, CSS, JavaScript, Bootstrap
- Backend: PHP
- Database: MySQL
- Server: Apache (XAMPP)
- Maps: Leaflet.js

## Setup Instructions

1. Install XAMPP on your system
2. Clone this repository to your htdocs folder
3. Import the database schema from `database/ecomap.sql`
4. Configure database connection in `config/database.php`
5. Access the application through `http://localhost/Ecomap3`

## Directory Structure

```
Ecomap3/
├── assets/
│   ├── css/
│   ├── js/
│   └── images/
├── config/
├── includes/
├── admin/
├── user/
└── database/
```

## Requirements

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Apache Web Server
- Modern web browser with JavaScript enabled 