module UsersHelper
    def user_list()
        user_post_list = Array.new
        @user.posts.each do |post|
        user_post_list.push({"title" => post.title, "url" => post.full_url, "content" => post.content})
        end
        {"user_name" => @user.name, "user_bio" => @user.bio, "user_email" => @user.contact_email, "user_title" => @user.title, "posts" => user_post_list}
    end
end
