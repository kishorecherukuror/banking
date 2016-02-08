class AccountsController < ApplicationController
	before_action :find_account, only: [:show, :edit, :update, :destroy, :transfer]

	def index
        @accounts= Account.all
	end

	def new
		@account = Account.new
	end

	def show
	end

	def transfer

	end

	def create
		@account = Account.new(account_params)
		if @account.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		if @account.update_attributes(account_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def edit
	end

	def destroy
		@account.destroy
		redirect_to root_path
	end

	private

	def account_params
			params.require(:account).permit(:firstname, :lastname, :dob, :account_balance, :address)
	end

	def find_account
		@account = Account.find(params[:id])
	end

end
