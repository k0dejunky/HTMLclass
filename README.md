# WebMVC

 WebMVC - This MVC is currently in development. It is in the very early stages and isn't ready for use. The files contained in the repository are:

WebModel.pm - This holds the sites data and mode information. The module uses WebDB.pm to push and retrieve all data from the mysql database. 

WebDB.pm - uses db.conf to read the database connection information. It opens and closes the connection with each action to prevent memory leaks. 

WebController.pm - This passes user data to WebModel.pm and view data to index.cgi to display the correct page 

index.cgi - This is the view. It uses WebTemplater.pm to choose what is to be displayed depending on the info retrieved from WebController.pm

WebTemplater.pm - This module uses GUI.pm to generate the requested page.

GUI.pm - This module simply returns an HTML string depending on the input and function used. The function naming convention used directly matches the HTML tag name. Ex: html tag h1 would be function call.

Ex: $GUI->h1(class=>"class name", text=>"text");


The function is overloaded so it can take anything from 1 required input (which is the text) to any number of inputs that the element can receive. To better understand the accepted inputs review the HTML5 documentation to see what each element accepts keeping in mind that the text displayed by the element is REQUIRED.


