module PagesHelper 
    def list()
        post_list_items = Array.new
        page_list_items = Array.new
        if @page.postable?
            @page.posts.each do |post|
                post_list_items.push({"title" => post.title, "created_at" => post.created_at, "url" => post.url, "content" => post.content, "full_url" => post.full_url})
            end
        end
        
        if @other_pages.present?
            @other_pages.each do |page|
                page_list_items.push({"name" => page.name, "slug" => page.full_url})
            end
        end
        
        
            
        
        { "posts" => post_list_items, "pagetitle" => @page.name, "pages" => page_list_items}
    end
end
