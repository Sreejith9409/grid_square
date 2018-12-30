class SquareBoardsController < ApplicationController

	# POST /update_square_board
  # POST /square_board/:id/update_square_board.json
	def update_square_board
		square_board = SquareBoard.where(id: params["square_board_id"]).last
		data_hash = square_board.cols_data_hash.dup
		# [User's user_name, color, current_time]
		data_hash[params[:key].to_i] = [current_user.user_name, params[:color], CommonUtils.get_current_time]
		square_board.cols_data_hash = data_hash
		errors = ""
		if !square_board.save
			errors = square_board.errors.full_messages.join("</br>") 
		end
		title = "Last Updated By #{data_hash[params[:key].to_i][0]} at #{CommonUtils.format_date_time data_hash[params[:key].to_i][2]}"
		# Passing values to update the data in current session without reloading page
	  render json: {is_updated: errors.blank?, errors: errors, color: params[:color], key: params[:key], title: title} and return		
	end

	# GET /leader_board
  # GET /square_board/:id/leader_board.json
	def leader_board
		square_board = SquareBoard.where(id: params[:square_board_id]).last
		@users_hash = {}
		# Constructing data to show in table.
		square_board.cols_data_hash.each do |k,v|
			@users_hash[v[0]] ||= []
			@users_hash[v[0]] << v[1]
		end
	end

end
