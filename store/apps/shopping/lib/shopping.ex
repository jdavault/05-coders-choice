defmodule Store.Shopping do
  
  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    #supervision goes here
    start_state_supervisor()
    start_database_supervisor()
  end

  def start_database_supervisor do
    #start the supervised DB
    db_worker = worker(Store.Shopping.Db, [database: "store"])
    Supervisor.start_link [db_worker], strategy: :one_for_one
  end

  #define our parent supervisor
  def start_state_supervisor do
    #spec the state supervisor
    state_worker = worker(Store.Shopping.State, [])
    Supervisor.start_link([state_worker], strategy: :simple_one_for_one, name: Store.StateSupervisor)
  end


  def start_state(key: key) when is_binary(key), do: raise "Please use an atom key"
  def start_state(key: key) when is_atom(key) do
    _res = Supervisor.start_child(Store.StateSupervisor, [%{key: key}])
  end

end
