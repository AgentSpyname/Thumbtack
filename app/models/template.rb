class Template < ActiveRecord::Base
    has_many :pages
    has_many :posts, :class_name => "Monologue::Post"
end
