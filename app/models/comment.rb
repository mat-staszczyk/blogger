class Comment < ActiveRecord::Base
  belongs_to :article
  has_one :moderator_approval, as: :content
  include TextContent

end
