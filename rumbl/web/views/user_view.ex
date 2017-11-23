defmodule Rumbl.UserView do 
  use Rumbl.Web, :view 
  alias Rumbl.User

  def first_name(%User{name: name}) when name == nil, do: 'Name not stored in DB' 

  def first_name(%User{name: name}) do
  	name
    |> String.split(" ")
    |> Enum.at(0)
  end 

end