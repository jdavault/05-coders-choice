defmodule Store.Ordering.Order do

  defstruct [
     store_id: nil,
     customer_id: nil,
     status: "open",
     customer_name: nil,
     customer_email: nil,
     address: %{street: nil, street2: nil, city: nil, state: nil, zip: nil, country: nil},
     id: nil,
     key: nil,
     landing: "/",
     message: nil,
     ip: "127.0.0.1",
     items: [],
     history: [],
     invoice: nil,
     payment: nil,
     summary: %{item_count: 0, total: 0.00, subtotal: 0.0},
     logs: [%{entry: "order Created", date: "iso_now"}],
     deliverables: []
   ]

end