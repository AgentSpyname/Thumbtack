module PagesHelper 
    
    def check_template_present(x)
        if x.present?
            return x.template
        else
            return x
        end
    end
    
    def list()
        post_list_items = Array.new
        page_list_items = Array.new
        menu_list_items = Array.new
        if @page.name != "Homepage"
            page_title = @page.name + " |" + @app_name
        else
            page_title = @appname
        end
        
        @menu_items.each do |item|
            menu_list_items.push({"name" => item.name, "slug" => item.slug })
        end
            
    
        if @page.postable?
            @page.posts.each do |post|
                post_list_items.push({"title" => post.title, "created_at" => post.created_at, "url" => post.url, "content" => post.content, "full_url" => post.full_url })
            end
        end
        
        if @other_pages.present?
            @other_pages.each do |page|
                page_list_items.push({"name" => page.name, "slug" => page.full_url})
            end
        end
   
            
        
        { "posts" => post_list_items, "appname" => @app_name, "pagetitle" => @page.name, "page_title" => page_title, "pages" => page_list_items, "widget1" => @widget1, "widget2" => @widget2, "widget3" => @widget3, "widget4" => @widget4, "widget5" => @widget5, "widget6" => @widget6, "widget7" => @widget7, "widget8" => @widget8, "widget9" => @widget9, "widget10" => @widget10, "footer" => @footer, "selected_posts" => @array_selected_posts, "menu_items" => menu_list_items }
    end
end
