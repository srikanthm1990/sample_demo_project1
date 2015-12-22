class ClientsController<ApplicationController
	
	def index
		@clients = Client.all
	end

	def show
		@clients = Clients.find(params[:id])
	end

	def new 
		@clients = Clients.new
	end

	def create
		@clients = Clients.new(clients_params)
		@clients.save
		redirect_to_clients_path
	end

	private
	def clients_params
	params.require(:clients).permit( :name, :client_id )
	end 


end