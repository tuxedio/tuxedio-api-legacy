Description of Each Model, View, & Controller and its purpose within the
App!
===============

##MODELS:
1. Users - Validates the basic user attributes
2. Person - Validates the basic person attributes
3. Vendor - Validates the basic vendor attributes
4. Blogger - Validates the basic blogger attributes
6. Experiences - Validates all aspects of an experience created by vendor
7. TimeSlots - Validates accepted times in which an experience can be created
8. Adventures - Validates a list of different itineraries
9. Journey - Validates model for organizing users experiences
10. Blog_Posts - Validates model for bloggers to post their stories

##CONTROLLERS
1. user_controller - Add ability to create and edit user profile
2. person_controller - Extends user controller with top 3 picks and journey
3. vendor_controller - Extends user controller with ability to list experiences and have name/logo
4. blogger_controller - Extends user controller with ability to create blog posts
5. experiences_controller - Extends vendor controller to create, edit, and destroy their experiences
6. timeslots_controller - Manages timeslots for experiences so that multiple experiences can have different or the same timeslots.
7. adventures_controller - Allows users to create, edit, and destroy collections of itineraries.
8. Journey_controller - Adds ability to create, sort, edit, and destroy journey items
9. blogpost_controller - Adds ability to create, edit, and destroy blog posts.

##VIEWS
1. Explore Page - This page will allow users to select experiences of things to do around Boulder (or eventually any given town), giving them the option to add these experiences to their personal journey. It populates experiences based on a city the user has chosen, giving a simple user interface to get a high level view of things to do.
2. Add an Experience Page - Users can choose what day and time they would like to add the event to their journey.
3. User/Vendor Sign-up Page - Users can sign up as either a vendor or a person, and will have various options based on their user type.
4. User Profile Settings - This page will allow users to update profile preferences. They can also make their own top 3 local picks from the available experiences.
5. User Journey - This page will list the experiences that have been added to a user’s journey and allow for the option of printing this list.
6. Local’s Picks - Shows top local places to visit (all rankings here are based solely off users that live in the area)
7. View a user Page - See a user’s profile including their top 3 local picks.
8. Vendor Profile Setting - Vendors can view and edit their company info, picture, and other pertinent information.
9. Vendor Add an Experience - Allows vendors to add new experiences to their company profile.
10. Vendor Update an Experience -  Vendors can edit, update, and remove experiences they have previously created.
11. Blog Page -Writers for the site will be able to blog about towns. Much like the New York Times, this section will contain enticing articles to intrigue the user.
12. View a user Page - See a user’s profile including their top 3 local picks.
13 . View a Vendor - See information about a company that is offering experiences.

