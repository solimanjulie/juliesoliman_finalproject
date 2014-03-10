# This file should contain all the record creation needed to seed the database with its default values.

# Create some users
users_data = [ { :name => "Julie Soliman",
                 :email => "julie@example.com",
                 :password => "hockey",
                 :password_confirmation => "hockey"
                },
                { :name => "Test User",
                 :email => "test@email.com",
                 :password => "test123",
                 :password_confirmation => "test123"
                },
                { :name => "User Name",
                 :email => "user@email.com",
                 :password => "password",
                 :password_confirmation => "password"
                },
                { :name => "Jeff Cohen",
                 :email => "jeff@example.com",
                 :password => "hockey",
                 :password_confirmation => "hockey"
                },
                { :name => "John Doe",
                 :email => "jdoe@gmail.com",
                 :password => "johndoe123",
                 :password_confirmation => "johndoe123"
                }
            ]

User.destroy_all
users_data.each do |user_data|
  u = User.new
  u.name = user_data[:name]
  u.email = user_data[:email]
  u.password = user_data[:password]
  u.password_confirmation = user_data[:password_confirmation]
  u.save
end

# Create some posts
posts_data = [ {text: "Here is some text"},
                {text: "Here is some more text"},
                {text: "New to this Flitter thing... how does it work?"},
                {text: "I like apples"},
                {text: "I learned so much in my Web Development class this quarter!"},
                {text: "It's snowing again. :("},
                {text: "Here is some more text"},
                {text: "Can't wait to get home and watch the winter olympics"},
                {text: "Has anyone seen that new Lego movie?"},
                {text: "HELLO!"},
                {text: "This is seeded data!"},
                {text: "Weren't the Oscars great?"},
                {text: "Can't wait for summer!"}
                ]

start_index = User.first.id

Post.destroy_all
posts_data.each do |post_data|
Post.create(:text => post_data[:text], :user_id => start_index+rand(User.count))
end

# Create some following relationships
Follow.destroy_all
Follow.create(leader_id: start_index, follower_id: start_index+1)
Follow.create(leader_id: start_index+1, follower_id: start_index)
Follow.create(leader_id: start_index+2, follower_id:start_index)
Follow.create(leader_id: start_index+2, follower_id:start_index+3)

# Create some likes
post_start_index = Post.first.id
post_end_index = Post.last.id

Like.destroy_all
Like.create(post_id: post_start_index, user_id: start_index)
Like.create(post_id: post_start_index, user_id: start_index+1)
Like.create(post_id: post_end_index, user_id: start_index)

# Create some comments
Comment.destroy_all
Comment.create(text: "Wow that is incredibly interesting!", post_id:post_start_index, user_id: start_index)
Comment.create(text: "Yes! They were so awesome!", post_id:post_end_index-1, user_id: start_index+1)
Comment.create(text: "It's gonna be the best summer everrr!", post_id:post_end_index, user_id: start_index)
Comment.create(text: "Me too!!", post_id:post_end_index, user_id: start_index+1)
Comment.create(text: "I really can't wait!", post_id:post_end_index, user_id: start_index+1)

# Create some topics
Topic.destroy_all
Topic.create(:name => "Apples")
Topic.create(:name => "Flitter")
Topic.create(:name => "WebDev")
Topic.create(:name => "Olympics")
Topic.create(:name => "Lego")
Topic.create(:name => "Movies")
Topic.create(:name => "Snow")
Topic.create(:name => "Weather")

topic_start_index = Topic.first.id
topic_end_index = Topic.last.id

# Create some mentions relationships
Mention.destroy_all
Mention.create(post_id:post_start_index+2 , topic_id: topic_start_index+1)
Mention.create(post_id:post_start_index+3 , topic_id: topic_start_index)
Mention.create(post_id:post_start_index+4 , topic_id: topic_start_index+2)
Mention.create(post_id:post_start_index+5 , topic_id: topic_end_index-1)
Mention.create(post_id:post_start_index+5 , topic_id: topic_end_index)
Mention.create(post_id:post_start_index+7 , topic_id: topic_start_index+3)
Mention.create(post_id:post_start_index+8 , topic_id: topic_start_index+4)
Mention.create(post_id:post_end_index , topic_id: topic_end_index)
