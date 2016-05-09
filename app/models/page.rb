class Page < ActiveRecord::Base
    validates_uniqueness_of :slug
    has_many :posts, :class_name => "Monologue::Post", :foreign_key => "page_id"
    belongs_to :layout
    belongs_to :template

  def to_param
    slug
  end
  
  def full_url
    "#{Monologue::Engine.routes.url_helpers.root_path}#{self.slug}"
  end
  
  before_save do
    if self.layout.name.present?
      self.layout_name = "pagecustom"
    else
      self.layout_name = "application"
    end
    
  end
end
