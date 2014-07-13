#Readme for Instructors

We completed a majority of the work we intended in our proposal. 
The biggest part of our proposal was getting an activity itinerary working. There are two user types: vendors and customers. Vendors can create activiites, that show up on the explore page. Customers can visit the explore page and add activities to a adventure itinerary that is sorted by activity time.

There were two parts that we dropped from our final project that were in our proposal: a blog, and a user's top 3 picks page.
The top 3 picks has backend code to store the picks, but we did not have time to integrate it into our actiivites list to make selecting these top three picks easy for our end user.

There were also a few things that we did that were beyond the scope of the original project. 
We were able to properly configure confirmable accounts using devise (where email confirmations are sent when creating an account). We put together a deploy system using capistrano that would automate deploys to our remote server. This server also had to be setup using Engine X rather than Apache. We integrated Travis CI to automatically check our tests are all passing when uploading a new commit to github. 
We integrated the Yelp API to pull customer information from yelp when they sign up. We also utilized imagemagick and paperclip to allow users to upload custom pictures to our site, rather than just using gravitars. 
