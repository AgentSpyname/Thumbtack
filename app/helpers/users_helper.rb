module UsersHelper
    def user_list()
        {"user_name" => @user.name, "user_bio" => @user.bio, "user_email" => @user.contact_email, "user_title" => @user.title}
    end
end
