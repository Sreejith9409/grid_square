class SquareBoard < ApplicationRecord
	serialize :cols_data_hash
  validates_presence_of  :board_name
  validates_presence_of  :cols
  validates_presence_of  :rows
  validates_uniqueness_of  :board_name
end
