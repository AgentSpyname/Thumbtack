class Setting < ActiveRecord::Base
    def checked_entry
        if self.contents?
            return false
        else
            return true
        end
    end
end
