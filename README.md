# Asset Management

## Purpose
### An asset management application working with local server. To be able to use the application, first run local server with npm start and then run the application. 

### Developed with Swift 4.2 and XCode 10

###   Project applies MVVM with a little reactive touch. Lifecycle goes like this. View controller tells the view model what to do, view model does its work and updates it's state, then sends a change to view controller via change block. With this change view controller updates what needs to be updated. 


## Screen Explainations

● To login the system, user needs to enter admin email and password, which are `admin@admin.com` and `admin`.

●  After login, user can see all employees in the screen. Tapping any employee navigates to action screen. In this screen user can add new asset to selected employee or show record history for that employee.

● After login, user can swipe left or tap Assets title to see all assets. With button at bottom, new asset can be added. 
