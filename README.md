# Car Rental Management System

The Car Rental Management System is a web application developed using Jakarta EE, JPA, Servlet, and JSP technologies. It provides a platform for users to rent cars based on availability, specify rental details, and manage rental transactions seamlessly.

## Features

### 1. Car Rental
Customers can rent cars by specifying the desired brand, rental dates, and return dates. The system checks the availability of the selected car and processes the rental request accordingly.

### 2. Online Rental Booking
Customers have the option to book rentals online through the web application. They can browse available cars, select their preferences, and complete the booking process conveniently.

### 3. Meetup Scheduling (Rendezvous)
Upon rental confirmation, customers can schedule a meetup for car pickup and return. The system manages meetup details and ensures smooth coordination between customers and rental service providers.

### 4. Billing (Facture) Generation
The system generates invoices (factures) for rental transactions, calculating the total price based on the number of days rented and the selected car brand. Customers can view and download invoices for their rental transactions.

## Technologies Used

- **Jakarta EE**: Provides a robust platform for building enterprise-level Java applications, including web-based systems.
- **JPA (Java Persistence API)**: Offers a standard way to access and manage relational databases in Java applications.
- **Servlet**: Handles requests and responses between the web client and the server, enabling dynamic web content generation.
- **JSP (JavaServer Pages)**: Enables the development of dynamic web pages with Java code embedded within HTML.
- **MySQL**: A relational database management system used for storing rental and customer data.

## Getting Started

To run the Car Rental Management System locally, follow these steps:

1. Clone the repository:
git clone https://github.com/haitammabrouk/CarRental

2. Set up a MySQL database and configure the database connection details in the `persistence.xml` file located in the `src/main/resources/META-INF` directory.

3. Build the project using Maven:
mvn clean install

4. Deploy the generated WAR file to a Jakarta EE-compatible application server such as Apache Tomcat or WildFly.

5. Access the application in your web browser.

## Contributors

- Mabrouk Haitam
