defmodule Shopservices.Product.Impl do

  alias Shopservices.Product
  import Ecto.Query 

  def create(name, description, unit_size, unit_of_measure, price, image) do
  	%Product{}
  	|> Product.changeset(%{name: name, description: description, unit_size: unit_size, 
                           unit_of_measure: unit_of_measure, price: price, image: image})
  	|> Shopservices.Repo.insert!
  end

  def read() do
  	from(prd in Product,
  	  select: [ prd.id, prd.name, prd.description, prd.unit_size,
  	            prd.unit_of_measure, prd.image, prd.price  ],
  	  order_by: prd.updated_at)
  	|> Shopservices.Repo.all
  	
  end

  def read_by_id(id) do
  	from(prd in Product, where: [id: ^id])
  	|> Shopservices.Repo.one
  end

  def update(id,updates) do
    read_by_id(id)
  	|> Product.changeset(updates)
  	|> Shopservices.Repo.update!
  end	

  def delete(id) do
    read_by_id(id)
    |>Shopservices.Repo.delete()
  end


end