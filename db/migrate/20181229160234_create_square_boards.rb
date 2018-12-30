class CreateSquareBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :square_boards do |t|
    	t.column :board_name, :string
    	t.column :rows, :integer
    	t.column :cols, :integer
    	t.column :cols_data_hash, :longtext
      t.timestamps
    end
    # By default I am creating 20*20 rows. As this task is for 20*20. 
    data_hash = {}
    index = 0
    for i in 1..20
    	for j in 1..20
    		index += 1
    		data_hash[index] = []
    	end
    end
    SquareBoard.create!({:board_name => "20*20 square", :rows => 20, :cols => 20, :cols_data_hash => data_hash})
  end
end
