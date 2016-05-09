module Monologue
    module PostsHelper
        def the_post_list()
            the_post_list_items = { "title" => @post.title, "created_at" => @post.created_at, "updated_at" => @post.updated_at, "user_id" => @post.user_id, "content" => @post.content, "url" => @post.url, "published_at" => @post.published_at, "tags" => @post.tags}
            post_tag_list_items = Array.new
            
            @post.tags.each do |tag|
                post_tag_list_items.push({"name" => tag.name})
            end
                
            { "post" => the_post_list_items, "tags" => post_tag_list_items}
        end
        
        
end
end