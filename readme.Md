This README file provides instructions on how to run the Struts 2 app. Please follow the steps below:

Prerequisites : 

Before running the project, make sure you have the following software installed: Tomcat 9 , Maven 

Configuration : 

Download and install Tomcat 9 from the official website.
Download and install Maven from the official website.

Database Configuration

Open the ApplicationContext.xml file located in your project ressources 

Locate the following bean configuration:

xml : 

<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
     <property name="driverClassName" value="com.mysql.jdbc.Driver"></property>
     <property name="url" value="jdbc:mysql://localhost:3306/g_vente"></property>
     <property name="username" value="root"></property>
     <property name="password"  value="04072000"></property>
</bean>

Modify the values of the url, username, and password properties to match your database credentials. Ensure the URL points to the correct database host, port, and name.

Running the Project : 

Open the project's properties (e.g., right-click on the project's name in the project explorer and select "Properties").
Select "Deployment Assembly".
Click the "Add..." button on the right margin.
Select "Java Build Path Entries" from the menu of Directive Type and click "Next".
Select "Maven Dependencies" from the Java Build Path Entries menu and click "Finish".

then run the project on the tomcat server.