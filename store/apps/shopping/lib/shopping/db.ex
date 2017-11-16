defmodule Store.Shopping.Db do  
  use Moebius.Database
  import Moebius.DocumentQuery
  alias Store.Shopping.Db

  #state stuff
  def find_or_create_state(%{key: key, domain: _domain} = args) do
    case db(:state) |> contains(key: key) |> Db.first do
      nil -> db(:state) |> Db.save(struct(%Store.Shopping.State{}, args))
      found -> found
    end
  end

  def save_state(state) do
    db(:state) |> Db.save(state)
  end

end  