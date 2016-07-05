About


This project builds a rails blog with posts and comments. The program will perform an action based on the params.

Examples

##Displays first 10 posts and child from root
http://localhost:3000/

##Displays first 10 posts and child comments when params == posts
http://localhost:3000/posts

##Displays post with that post_id and all child comments
http://localhost:3000/posts/1

##Displays all comments
http://localhost:3000/comments

##Displays comment with that comment_id
http://localhost:3000/comments/2

##Displays only the comments of specified post_id
http://localhost:3000/posts/1/comments

##Displays 10 posts (with child comments) per page
http://localhost:3000/posts?page=1
http://localhost:3000/posts?page=2
etc

##Can create new posts (post_id generates at next unused post_id)
##Can create new comments
##Can specify which post you want comments to fall under
