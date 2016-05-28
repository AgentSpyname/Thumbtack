class SelectedPost < ActiveRecord::Base
    belongs_to :post, :class_name => "Monologue::Post"
    validates_presence_of :post
end
