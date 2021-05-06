Go on BBQ!
=====================
Educational app to publish any events with the opportunity to subscribe to the event, publish photos, leave comments.
You can try bbq here:

![image](https://user-images.githubusercontent.com/71513174/117353340-ac212180-aeb8-11eb-8485-cae4fdca1fda.png)

After registration, users can create any event, add a description, invite friends there, follow who will go to it, 
as well as share photos and comments before and after it.
On the main page there is a tile with all the events that you can go to and see detailed information.
If the user wants to make a private event, you can set a pincode for access.

For ease of use, event addresses are displayed in Yandex maps.
So that event subscribers can follow new comments, subscriptions or photos
the application implements automatic mail notifications.
If the user has forgotten the password for the account, it is also possible to restore it by mail.

### Requirements:
```
ruby '2.7.0' and Ruby on Rails 6.0.3
```

### Installation:
```
git clone git@github.com:onlykir/bbq.git
```

### Running:
To run the application, you need to run `bundle` in the application directory to install all the necessary gems and roll all migrations.

+ go to the desired directory
```
cd bbq
```
+ catch the necessary gems
```
bundle
``` 
+ roll migrations
```
rails db:migrate
``` 
+ launch
```
rails s
``` 
And the app will be available on the local server.

To build javascript modules and assets, you may need to additionally run a local webpack server.
To do this, in a new terminal window, use the command:
```
bin/webpack-dev-server
``` 
-----------------------------------
### The application also implements the following features:
+ user registration with Devise
+ uploading photos with carrierwave
+ storing photos on AWS S3 (for production environment)
+ using internationalization I18n
