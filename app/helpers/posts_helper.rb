module PostsHelper
     def search_list()
         search_results = Array.new
         page_title = "#{params[:search]} | #{@app_name}"
         @posts.each do |post|
             search_results.push({"post_title" => post.title, "post_author" => post.user.name, "post_desc" => truncate(post.content, :length => 100), "post_url" => post.full_url})
         end
         { "query" => params[:search], "search_results" => search_results, 'page_title' => page_title, 'appname' => @app_name, 'widget1' => @widget1, 'widget2'=> @widget2, 'widget3' => @widget3, 'widget4' => @widget4, 'widget5' => @widget5, 'widget6' => @widget6, 'widget7' => @widget7, 'widget8' => @widget8, 'widget9' => @widget9, 'widget10' => @widget10, "menu_items" => @menu_list_items,  "selected_posts" => @array_selected_posts}
         
     end
end
