About


This project builds a rails blog with posts and comments. The program will perform an action based on the params.

Examples

##Displays first 10 posts and child from root
http://localhost:3001/

##Displays first 10 posts and child comments when params == posts
http://localhost:3001/posts

##Displays post with that post_id and all child comments
http://localhost:3001/posts/1

##Displays all comments
http://localhost:3001/comments

##Displays comment with that comment_id
http://localhost:3001/comments/2

##Displays only the comments of specified post_id
http://localhost:3001/posts/1/comments

##Displays 10 posts (with child comments) per page
http://localhost:3001/posts?page=1
http://localhost:3001/posts?page=2
etc

##Displays all published posts and child comments
http://localhost:3001/posts/published

##Displays all unpublished posts and child comments
http://localhost:3001/posts/unpublished

##Typing in an incorrect action redirects page to /posts/:id
http://localhost:3001/posts/1/asdf


##Can create new posts (post_id generates at next unused post_id)
##Can create new comments
##Can specify which post you want comments to fall under
