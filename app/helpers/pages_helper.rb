module PagesHelper 
    def list()
        post_list_items = Array.new
        page_list_items = Array.new
        menu_list_items = Array.new
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
   
            
        
        { "posts" => post_list_items, "pagetitle" => @page.name, "pages" => page_list_items, "widget1" => @widget1, "widget2" => @widget2, "widget3" => @widget3, "widget4" => @widget4, "widget5" => @widget5, "widget6" => @widget6, "widget7" => @widget7, "widget8" => @widget8, "widget9" => @widget9, "widget10" => @widget10, "footer" => @footer, "selected_posts" => @array_selected_posts }
    end
end
