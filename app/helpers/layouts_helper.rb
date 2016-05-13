module LayoutsHelper
    def layout_params()
        @menu_list_items = Array.new
            @menu_items.each do |item|
                @menu_list_items.push({"name" => item.name, "slug" => item.slug })
            end
   #{"menu_items" => menu_list_items, 'page_content' => yield, 'page_title' => yield(:title)}
      end
end
