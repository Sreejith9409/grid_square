class SquareBoardsController < ApplicationController

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
	  render json: {is_updated: errors.blank?, errors: errors, color: params[:color], key: params[:key], title: title} and return
		
	end
end
