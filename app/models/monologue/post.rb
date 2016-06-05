class Monologue::Post < ActiveRecord::Base
  is_impressionable
  has_many :taggings
  has_many :tags, -> { order "id ASC" }, through: :taggings, dependent: :destroy
  before_validation :generate_url
  belongs_to :user
  belongs_to :page, :class_name => "::Page"
  belongs_to :layout
  belongs_to :template
  has_many :selected_posts, :class_name => "::SelectedPost"
  
  self.per_page = 5
  include PublicActivity::Model
  


  scope :default,  -> {order("published_at DESC, monologue_posts.created_at DESC, monologue_posts.updated_at DESC") }
  scope :published, -> { default.where(published: true).where("published_at <= ?", DateTime.now) }

  default_scope{includes(:tags)}

  validates :user_id, presence: true
  validates :title, :content, :url, :published_at, presence: true
  validates :url, uniqueness: true
  validate :url_do_not_start_with_slash
  
  before_save do
  
     self.layout_name = "pagecustom"
    if self.template_id.nil?
      self.template_id =  ::Template.where(:name => "Show Posts").first.id
    end
    
    
  end

  def self.search(search)
      where("title LIKE ?", "%#{search}%")
  end
  
  def self.description
    self.content
  end
    
  def tag_list= tags_attr
    self.tag!(tags_attr.split(","))
  end

  def tag_list
    self.tags.map { |tag| tag.name }.join(", ") if self.tags
  end

  def tag!(tags_attr)
    self.tags = tags_attr.map(&:strip).reject(&:blank?).map do |tag|
      Monologue::Tag.where(name: tag).first_or_create
    end
  end

  def full_url
    "#{Monologue::Engine.routes.url_helpers.root_path}#{self.url}"
  end

  def published_in_future?
    self.published && self.published_at > DateTime.now
  end

  def self.page p
    paged_results(p, Monologue::Config.posts_per_page || 10, false)
  end

  def self.listing_page(p)
    paged_results(p, Monologue::Config.admin_posts_per_page || 50, true)
  end

  def self.total_pages
    @number_of_pages
  end

  def self.set_total_pages per_page
    @number_of_pages = self.count / per_page + (self.count % per_page == 0 ? 0 : 1)
  end

  private

  def self.paged_results(p, per_page, admin)
    set_total_pages(per_page)
    p = (p.nil? ? 0 : p.to_i - 1)
    offset =  p * per_page
    if admin
      default.limit(per_page).offset(offset)
    else
      limit(per_page).offset(offset)
    end
  end

  def generate_url
    if self.slug.present?
      self.url = "#{self.page.slug}/#{self.slug.parameterize}"
    else
      self.url = "#{self.page.slug}/#{self.title.parameterize}"
    end
  end

  def url_do_not_start_with_slash
    errors.add(:url, I18n.t("activerecord.errors.models.monologue/post.attributes.url.start_with_slash")) if self.url.start_with?("/")
  end
  
 
    
end