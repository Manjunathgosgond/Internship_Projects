#First Question
select * from post
where location in ("agra","maharashtra","west bengal");

#Second Question
select h.hashtag_name, count(f.user_id) as total_follows
from hashtags h join hashtag_follow f on h.hashtag_id = f.hashtag_id
group by h.hashtag_name
order by total_follows desc
limit 5;

 # Third Question
 select h.hashtag_name, count(p.post_id) as usage_count
from hashtags h join post_tags p on h.hashtag_id = p.hashtag_id
group by h.hashtag_name
order by usage_count desc
limit 10;

# Fouth Question
select username 
from users 
where user_id not in (select user_id from post);

# Fifth Question
select p.caption, count(l.user_id) as likes_count
from post p join post_likes l on p.post_id = l.post_id
group by p.caption
order by likes_count desc;

# Sixth Question
select count(post_id) / count(distinct(user_id)) as avg_post_per_user
from post;

# Seventh Question
select u. user_id, count(l.login_id) as no_of_logins
from login l join users u on l.user_id = u.user_id
group by u.user_id;

#Eighth Question
select u.user_id, u.username
from users u join post_likes l on u.user_id = l.user_id join post p on p.post_id = l.post_id
group by u.user_id, username
having count(distinct l.post_id) = (select count(*) from post);

# Ninth Question
select username
from users
where user_id not in (select user_id from comments);

#Tenth Question
select u.username
from users u join comments c on u.user_id = c.user_id join post p on c.post_id = p.post_id
group by username
having count(distinct c.post_id) = (select count(*) from post);

# Eleventh Question
select distinct u.user_id
from users u join follows f on u.user_id = f.followee_id
where f.follower_id is null;

# Twelth Question
select distinct u.user_id
from users u join follows f on u.user_id = f.follower_id
where f.followee_id is null;

#Thirteenth Question
select u.user_id, count(p.post_id)
from users u join post p on u.user_id = p.user_id
group by u.user_id
having count(P.post_id) > 5;

#Fourteenth Question
select u.user_id, count(f.follower_id) as follower_count
from users u join follows f on u.user_id = f.followee_id
group by u.user_id
having follower_count > 40
order by follower_count desc;

#Fifteenth Question
select comment_text
from comments
where comment_text like '%good' or comment_text like '%beautiful%';

#sixteenth Question
select caption, length(caption) as len
from post
order by len desc
limit 5;