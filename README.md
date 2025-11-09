🚗 Project: Car Rental Management System (Cartivate)
A web-based system designed to manage a fleet of rental cars, drivers, and reservations. Developed using the ASP.NET Web Forms model, utilizing Visual Basic as the code-behind language.

✨ Key Features
Multi-User Hierarchy: Supports multiple user roles, including Admin (master controls) and Employee (day-to-day operations).

Fleet Management: Modules for adding, viewing, and managing vehicle details.

Driver Management: System to register and manage employee drivers (data stored in c_driver_mst).

Availability Tracking: Dashboard displays real-time car and driver availability (fetched from c_vehicles and c_driver_mst).

Reservation System: Core functionality to track car rentals and returns.

Component              Technology	           Version
Framework	             ASP.NET Web Forms	  .NET Framework
Backend Logic	         Visual Basic (VB)	   Code-Behind Scripting
IDE	                   Microsoft Web         Development Environment
                       Developer 2010 Express	
Database	             MySQL	               Standard
Connector	             MySQL Connector/Net	 Data Connectivity

⚙️ Installation and Setup
Environment: Requires Microsoft Web Developer 2010 Express and MySQL Server installed.

Connector: Ensure the MySQL Connector/Net driver is installed on your machine.

Database: Create the required database in MySQL and import the schema, including the c_vehicles and c_driver_mst tables.

Project Load: Open the .sln file in Visual Web Developer 2010 Express.

Configuration: Verify the connection string in web.config to ensure it correctly points to your local MySQL instance.

Run: Run the project directly from the IDE for local testing using IIS Express.
