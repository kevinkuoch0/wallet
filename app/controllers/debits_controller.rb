class DebitsController < ActionController::Base

	def index
		@debits = Debit.all
	end

	def show
		@debits = Debit.all
	end

	def edit
		@debit = Debit.find(params[:id])
	end

	def new
		@debit = Debit.new
	end

	def create
		@debit = Debit.new(debitparams)
		if @debit.save
			flash[:notice] = "Card has been saved!"
			redirect_to users_path
		else
			flash[:alert] = "Card was not saved successfully."
			redirect_to users_path
		end
	end

	private

	def debitparams
		params.require(:debit).permit(:cardnumber, :cardtype, :expirationmonth, :expirationyear)
	end
end