defmodule Store.Shopping.State do

	use GenServer
	alias Store.Shopping.Db

	defstruct [

		store_id: nil,
		domain: nil,
		id: nil,
		key: nil,
		landing: "/",
		ip: "localhost",
		user_id: nil,
		items: [],
		logs: [%{entry: "State Created."}]
		]

	def start_link(%{key: _key} = args) do
		GenServer.start_link(__MODULE__, args)
	end

	def init(%{key: key, domain: _domain} = args) do
		#struct(%Store.Shopping.State{}, args)
		state = Db.find_or_create_state(args)
		{:ok, state}
	end
		
	# API methods
	def select_item(pid, item),  do: GenServer.call(pid, {:read_item, item})

	def remove_item(pid, sku: sku),  do: GenServer.call(pid, {:delete_item, sku: sku})

	def change_item(pid, sku: sku),  do: GenServer.call(pid, {:update_item, sku: sku})

	# internal GenServer methods
	def handle_call({:read_item, item}, _sender, state) do

	  state = %{state | items: List.insert_at(state.items, -1, item)} |> Db.save_state
	  {:reply, state, state}

	end

	def handle_call({:delete_item, sku: _sku}, _sender, _state) do
	end

	def handle_call({:update_item, sku: _sku}, _sender, _state) do
	end

	def save_state(%Store.Shopping.State{} = state, log: log) do
	    %{state | logs: List.insert_at(state.logs, -1, %{entry: log})} |> Db.save_state
	end

end