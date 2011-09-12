class BigPig < ActiveRecord::Base
  acts_as_editable :body, :textile
end
