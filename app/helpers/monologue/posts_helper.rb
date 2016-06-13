module Monologue
    module PostsHelper
        def the_post_list()
            the_post_list_items = { "title" => @post.title, "created_at" => @post.created_at, "updated_at" => @post.updated_at, "user_id" => @post.user_id, "content" => @post.content, "url" => @post.url, "published_at" => @post.published_at, "tags" => @post.tags, "author_name" => @post.user.name, "author_username" => @post.user.slug, "author_bio" => @post.user.bio, "about" => @post.about }
            post_tag_list_items = Array.new
            menu_list_items = Array.new
            
            page_title = @post.title + " |" + @app_name
      
            @post.tags.each do |tag|
                post_tag_list_items.push({"name" => tag.name, "url" => "#{Monologue::Engine.routes.url_helpers.root_path}tags/#{URI.encode(tag.name.mb_chars.to_s.downcase)}"})
            end
            
             @menu_items.each do |item|
                menu_list_items.push({"name" => item.name, "slug" => item.slug })
            end
                
            { "post" => the_post_list_items, "tags" => post_tag_list_items, "appname" => @app_name, "pagetitle" => @post.title, "page_title" => page_title,  "widget1" => @widget1, "widget2" => @widget2, "widget3" => @widget3, "widget4" => @widget4, "widget5" => @widget5, "widget6" => @widget6, "widget7" => @widget7, "widget8" => @widget8, "widget9" => @widget9, "widget10" => @widget10, "footer" => @footer, "selected_posts" => @array_selected_posts, "menu_items" => menu_list_items}
        end
        
     
        
end
end