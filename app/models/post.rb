class Post < ApplicationRecord
	 belongs_to :post, optional: true
	 # validates :title, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    WillPaginate.per_page = 5
    def self.search(term, current_page)
	  if term
	    page(current_page).where('name LIKE ?', "%#{term}%").order('id DESC')
	  else
	    page(current_page).order('id DESC') 
	  end
	end

end
