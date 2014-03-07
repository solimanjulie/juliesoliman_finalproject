# This file should contain all the record creation needed to seed the database with its default values.
users_data = [ { :name => "Julie Soliman",
                 :email => "julie@example.com",
                 :password => "hockey"
                },
                { :name => "Test User",
                 :email => "test@email.com",
                 :password => "test"
                },
                { :name => "User Name",
                 :email => "user@email.com",
                 :password => "password"
                },
                { :name => "Jeff Cohen",
                 :email => "jeff@example.com",
                 :password => "hockey"
                },
                { :name => "John Doe",
                 :email => "jdoe@gmail.com",
                 :password => "johndoe123"
                }
            ]

User.destroy_all
users_data.each do |user_data|
  u = User.new
  u.name = user_data[:name]
  u.email = user_data[:email]
  u.password = user_data[:password]
  u.save
end

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


Topic.destroy_all
Topic.create(:name => "Apples")
Topic.create(:name => "Flitter")
Topic.create(:name => "WebDev")
Topic.create(:name => "Olympics")
Topic.create(:name => "Lego")
Topic.create(:name => "Movies")
Topic.create(:name => "Snow")
Topic.create(:name => "Weather")

# Follow.destroy_all
# Follow.create(leader_id: start_index, follower_id: start_index+1)




