# How did I come to think of this kind of project?
The whole intention of this idea of creating the website was to really help out our student, help them to express their voices and opinions about our school and openly suggest the ideas of the grey areas where our school can improve on.

My first initiative was heavily focused on something called course evaluation, more specifically online course evaluation. I wanted to find more efficient and effective way of communicating between the studenta and teachers of our school. Course evaluation allowed students to freely share their honest experience with the courses they have taken - whether that is negative or positive -- it not only helps students to choose the best courses possible that meet their needs and interests -- but also helps the school to see the general opinion of the student body about certain courses.

# Features: 
Responsive Web page

Make an account! You need to have a VERIFIED account to access course evaluation. (In case of spamming, targeting a specific teacher, spreading false rumours).

Verification process involves Gmail API implementation to send the email and SHA256 to create a unique Hashcode for every user.

Report an inappropriate evaluation! This will send information to the admin account.

Evaluation search engine is successfully implemented -- by returning an ArrayList of evaluations. 

If “newest” then return the list ordered by evaluationID (auto_increment)

If “most useful” then return the list ordered by likeCount.

“Search engine” will be used every time a user post a evaluation with default values like “Newest” and “All grades” and display the list of evaluations.

Pagination of evaluations. 5 items per page.

Like/Delete a post. Using the “Primary key” value from MySql, you can easily put restrictions on such features. Ex) You cannot like a post more than once.

Secure coding. Prevents XSS (Cross-Scripting) attacks. Disables writing scripts by manually replacing all the “<” “>” tags to HTML code.

# Requirements
Programming language: Java (Server web programming: JSP)

IDE: Eclipse

Database: MySql (MariaDB Connector for hosting services)

Web Container: Tomcat

Design Frameworks: Bootstrap, MDL, Google Fonts, Font Awesome (for icons)

