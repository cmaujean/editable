class MeerKat < ActiveRecord::Base
  acts_as_editable :body, :textile
end
