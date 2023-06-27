class TimersController < ApplicationController
	def index
		@timers = Timer.all
	end

	def new
		@timer = Timer.new
	end

	def create
		
		last_entry = Timer.all.group_by(&:user_id).map{|s| s.last.last}.pluck(:user_status)
		# last_entry.each do |entry|
		# 	last_entry_user_status = entry.user_status
		# end
		if (last_entry[0] == "Wake")
			user_status_updated = "Sleep"
		else
			user_status_updated = "Wake"
		end
	    user_id = current_user.id
	    #@timer = Timer.new(params[:user_id => user_id, :user_status => last_entry])
	    @timer = Timer.create(user_id: user_id, user_status: user_status_updated)

	    if @timer.save
	      #redirect_to time_entries_path(date: @time.start_time.to_date)
	    else
	      render "new"
	    end
	end
end
