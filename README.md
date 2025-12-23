# Study Tracker
#### Video Demo: <https://youtu.be/eCrdy6_sjDw?si=1IEocNoyI5nRrc11>
#### Description:
Study Tracker is a web-based application designed to help users organize and monitor their study habits effectively. By logging study sessions with titles, start times, and end times, users can better visualize how they manage their study time and maintain consistent routines. The application automatically calculates the duration of each session in minutes, enabling users to track cumulative study hours over time.

The goal of this project was to create a simple but useful tool leveraging the concepts taught in CS50, including server-side programming, database management, and frontend development. Study Tracker allows users to add new study sessions, view a list of all recorded sessions, and store the data persistently using an SQLite database.

The application is structured to be intuitive and lightweight, ensuring smooth performance even on minimal hardware. It features a minimalist user interface to reduce distractions and focus on the core functionality of time tracking.

## Features:
- Add new study sessions with a session title, start time, and end time.
- Automatically calculate and display the duration (in minutes) of each session.
- View all previously recorded sessions in a clean, organized list format.
- Data is stored persistently using an SQLite database.
- Responsive design suitable for both desktop and mobile browsers.

## Technologies Used:
- **Python (Flask Framework):** Flask serves as the web server, handling routing and rendering templates.
- **SQLite:** A lightweight, file-based relational database is used for session storage.
- **HTML5 and CSS3:** These technologies are used to build and style the user interface.
- **Jinja2:** Flask's templating engine for rendering dynamic HTML content.

## Project Structure:
- `app.py`: This file is the main driver of the application. It initializes the Flask app, sets up the SQLite database, defines routes for adding and viewing study sessions, and calculates session durations.
- `templates/`: This directory contains all HTML templates:
  - `index.html`: The home page that provides navigation links.
  - `add.html`: A form where users can input study session data.
  - `list.html`: Displays a list of all saved study sessions, including titles, timeframes, and durations.
- `static/`: This directory contains the CSS file (`style.css`) responsible for styling the pages.
- `database.db`: The SQLite database file where session information is stored persistently.

## Design Choices:
Several design choices were made to keep the project accessible and maintainable:
- **Minimalist Design:** The UI was intentionally kept simple to focus on core functionality rather than visual complexity.
- **Single Database Table:** Since the project is small-scale, a single table (`sessions`) is sufficient to track all required information without unnecessary complexity.
- **Flask Framework:** Flask was chosen over more heavyweight frameworks to ensure quick development and ease of deployment.
- **Datetime Inputs:** The use of HTML5’s `datetime-local` input type simplifies data entry for users and ensures consistency in time format, minimizing backend validation needs.

## Challenges Encountered:
- Implementing proper time parsing and duration calculation required careful handling of datetime objects.
- Ensuring data persistence and avoiding SQL injection vulnerabilities was considered during database interactions by using parameterized queries.
- Maintaining a lightweight design while keeping the project robust enough to fulfill CS50’s final project requirements.

## How to Run the Project:
1. Ensure Python and Flask are installed.
2. Clone the project repository or download the files into a `project` folder.
3. Navigate to the project folder in the terminal.
4. Run `flask run` or `python app.py`.
5. Visit `http://127.0.0.1:5000/` in your web browser to access the application.
6. Add, view, and manage your study sessions!

## Future Improvements:
If I were to extend this project further, some features I would add include:
- User authentication to support multiple users.
- Graphs and visualizations of study patterns over time.
- Export study logs to CSV or PDF.
- Setting goals for weekly or monthly study hours.

---
This project was created as part of the CS50x 2025 curriculum. It draws upon the course’s teachings in programming, web development, and database management. I am grateful for the skills and knowledge I have gained through this course and look forward to applying them to more complex projects in the future.
