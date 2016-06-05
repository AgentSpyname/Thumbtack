module UsersHelper
    def user_list()
        user_post_list = Array.new
        menu_list_items = Array.new

        page_title = @user.name + "|" + @app_name
        
         @menu_items.each do |item|
            menu_list_items.push({"name" => item.name, "slug" => item.slug })
        end
        
        @user.posts.each do |post|
        user_post_list.push({"title" => post.title, "url" => post.full_url, "content" => post.content})
        end
        {"user_name" => @user.name, "user_bio" => @user.bio, "user_email" => @user.contact_email, "user_title" => @user.title, "posts" => user_post_list, 'pagename' => @user.name, 'page_title' => page_title, 'appname' => @app_name, 'widget1' => @widget1, 'widget2'=> @widget2, 'widget3' => @widget3, 'widget4' => @widget4, 'widget5' => @widget5, 'widget6' => @widget6, 'widget7' => @widget7, 'widget8' => @widget8, 'widget9' => @widget9, 'widget10' => @widget10, "menu_items" => menu_list_items, "selected_posts" => @array_selected_posts}
    end
end
