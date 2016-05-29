module PostsHelper
     def search_list()
         search_results = Array.new
         @posts.each do |post|
             search_results.push({"post_title" => post.title, "post_author" => post.user.name, "post_desc" => truncate(post.content, :length => 100), "post_url" => post.full_url})
         end
         { "query" => params[:search], "search_results" => search_results}
         
     end
end
