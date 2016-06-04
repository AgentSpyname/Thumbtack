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
    tracked :only => [ :update, :destroy, :create],  owner: Proc.new{ |controller, model| controller.current_user }

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
   
    if self.layout.present?
    else
      self.layout_id = Layout.where(:name => "Main Layout").last.id
    end
    
    if self.template.present?
    else
      self.template_id = Template.where(:name => "Show Pages").last.id
    end
    
    if self.layout.present?
      self.layout_name = "pagecustom"
    else
      self.layout_name = "application"
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
