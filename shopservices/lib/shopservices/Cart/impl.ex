defmodule Shopservices.Cart.Impl do

  alias Shopservices.{Cart, CartItem, Repo}

    use Ecto.Schema
    import Ecto.Changeset
    import Ecto.Query 


  def create(params) do
    cs = Cart.changeset(%Cart{}, params)
    |> IO.inspect
    |> validate_item_count(params)
    |> put_assoc(:cart_items, get_items(params))

    if cs.valid? do
      Repo.insert(cs)
    else
      cs
    end
  end

  defp get_items(params) do
    items = params[:cart_items] || params["cart_items"]
    Enum.map(items, fn(item)-> CartItem.changeset(%CartItem{}, item) end)
  end

  defp validate_item_count(cs, params) do
    items = params[:cart_items] || params["cart_items"]

    if Enum.count(items) <= 0 do
      add_error(cs, :cart_items, "Invalid number of items")
    else
      cs
    end
  end

  def read() do
  	from(cart in Cart,
  	  select: [ cart.customer, cart.amount, cart.date],
  	  order_by: cart.updated_at)
  	|> Repo.all
  	
  end

  def read_by_id(id) do
  	from(prd in Cart, where: [id: ^id])
  	|> Repo.one
  end

  def update(id,updates) do
    read_by_id(id)
  	|> Cart.changeset(updates)
  	|> Repo.update!
  end	


end