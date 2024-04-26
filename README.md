# Airline Reservation Management System

The Airline Reservation Management System is a Java-based application designed to streamline and automate the process of airline ticket reservations, passenger management, flight information tracking, and payment processing. This system provides a user-friendly interface for both customers and airline staff to perform various tasks related to flight bookings and management.

## Features

- **Flight Information**: View details about available flights, including flight code, source, destination, departure time, and arrival time.
- **Reservation Management**: Make new flight reservations for customers, update existing reservations, and cancel reservations if necessary.
- **Passenger Details**: Manage passenger information, including name, contact details, nationality, and passport information.
- **Payment Processing**: Process payments for flight reservations, including options for cash, credit card, and cheque payments.
- **Cancellation**: Allow customers to cancel their flight reservations and handle the cancellation process efficiently.
- **User Authentication**: Secure login system for airline staff to access the management system with username and password authentication.

## Technologies Used

- Java Swing for the graphical user interface (GUI).
- MySQL for the database management system.
- JDBC for database connectivity.
- IDE: IntelliJ IDEA.

## Installation

1. **Database Setup**:
   - Install MySQL database server on your system.
   - Create a new database named `airline_reservation`.
   - Run the SQL script provided in the `database/airline.sql` file to create the necessary tables and insert sample data.

2. **IDE Setup**:
   - Open the project in your preferred Java IDE (IntelliJ IDEA, Eclipse, etc.).
   - Configure the project SDK and libraries as needed.

3. **Run the Application**:
   - Compile and run the `Login.java` file to launch the application.
   - Ensure that the MySQL database server is running before launching the application.

## Usage

- Upon launching the application, users will be presented with the main interface displaying options for managing flights, reservations, passengers, payments, and cancellations.
- Users can navigate through the different functionalities using the menu bar or buttons provided in the GUI.
- Login with the provided credentials (username: admin, password: 12345) to access the management features.

## Contributors

- [Mahesh Sathe](https://github.com/maheshsathe07)
- [Prem Shejole](https://github.com/shejoleprem)

## License

This project is licensed under the [MIT License](LICENSE).
