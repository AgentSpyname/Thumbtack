class Page < ActiveRecord::Base
    validates_uniqueness_of :slug
    validates_presence_of :nested
    validates_presence_of :name
    validate :slash_not_allowed
    has_many :posts, :class_name => "Monologue::Post", :foreign_key => "page_id"
    belongs_to :layout
    belongs_to :template
  is_impressionable
    include PublicActivity::Model

  def to_param
    slug
  end
  
  def full_url
    "#{Monologue::Engine.routes.url_helpers.root_path}#{self.slug}"
  end
  
  def give_nested
      "#{self.slug}"
  end
  
  def slash_not_allowed
    if self.nested == "/"
    else
      if self.nested.start_with?('/')
        errors.add(:nested, "cannot start with a slash")
      end
    end
  end
  before_save do
   self.layout_name = "pagecustom"
   
   
    if self.template.present? and self.content.nil?
    else
      if self.content.present? == false
        self.template_id = Template.where(:name => "Show Pages").last.id
      end
    end
    
   
    
     if self.slug.present?
    else
      if self.nested == "/"
        self.slug = "#{self.name.parameterize}"
      else
        self.slug = "#{self.nested}/#{self.name.parameterize}"
      end
     end
    
  end
end
