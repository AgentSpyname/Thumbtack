class Monologue::User < ActiveRecord::Base
  has_many :posts
  
  has_secure_password
  
  include PublicActivity::Model

  
  
  validates_presence_of :password, on: :create
  validates_presence_of :name
  validates :email , presence: true, uniqueness: true
  validates_presence_of :slug
 

  def to_param
  slug
end

def username
  self.name.downcase.gsub(" ", "-")
end
  def can_delete?(user)
    return false if self==user
    return false if user.posts.any?
    true
  end
  
  
  
  def pretty_role
      if self.role == "admin"
           return "Admin"
         elsif self.role == "writer"
           return "Writer"
      elsif self.role == "cm"
           return "Content Manager"
      elsif self.role == "marketing"
          return "Marketer"
      else 
           return "Staff"
      end
  end
end