module AdminHelper
    def avatar_url(user)
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end
    
    def count_views(posts)
        total_views = 0;
        posts.each do |post|
            total_views = total_views + post.impressionist_count(:start_date => Time.now.strftime("%Y-%m-%d"))
        end
        
        return total_views
    end

end
