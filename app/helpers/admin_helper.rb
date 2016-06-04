module AdminHelper
    def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
    
    def count_views(posts)
        total_views = 0;
        posts.each do |post|
            total_views = total_views + post.impressionist_count(:start_date => Time.now.strftime("%Y-%m-%d"))
        end
        
        return total_views
    end
    
    def count_views_homepage(h)
        total_homepage_views = 0;
        h.each do |view|
            total_homepage_views = total_homepage_views + view.impressionist_count(:start_date => Time.now.strftime("%Y-%m-%d"), :message => "Homepage")
        end
        return total_homepage_views
    end
    
    def pluralize_without_count(count, noun, text = nil)
     if count != 0
        count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
     end
    end

    def post_time_colour(views)
        avg = 0
        x = 0
        Monologue::Post.all.each do |post|
            avg = post.impressionist_count + avg
            x = x + 1
        end
        
        avg = avg / x
        
        if avg > x
            return "danger"
        elsif avg < x
            return "success"
        else avg == x 
            return"primary"
        end
    end
    
    def get_activity_action(x)
        if x == "monologue_post.update"
            return "updated the post "
        elsif x == "monologue_post.destroy"
            return "deleted the post "
        elsif x == "monologue_post.create"
            return "created the post "
        elsif x == "page.create"
            return "created the page "
        elsif x == "page.update"
            return "update the page "
        elsif x == "page.destroy"
            return "deleted the page "
        elsif x == "monologue_user.create"
            return "created the user "
        elsif x == "monologue_user.update"
            return "updated the user "
        elsif x == "monologue_user.destroy"
            return "deleted the user "
            
        end
    end
    
    def check_type_of_activity(y)
        if y.key.include?("monologue_post")
            return get_activity_action(y.key) + y.trackable.title 
        else
            return  link_to get_activity_action(y.key) + y.trackable.name
        end
    end

end
