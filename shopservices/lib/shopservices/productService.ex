defmodule Shopservices.ProductService do

alias Shopservices.Product.Impl

    defdelegate create(name, description, unit_size, unit_of_measure, price, image),   to: Impl
    defdelegate read(),                                                                to: Impl
    defdelegate read_by_id(id),                                                        to: Impl
    defdelegate update(id,updates),                                                    to: Impl
end
