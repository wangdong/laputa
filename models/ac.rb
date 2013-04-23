class Ac
  include Dynamoid::Document

  table :name => :ac_sampling, :key => :sampling_id, :read_capacity => 10, :write_capacity => 10

  field :node
  field :temp, :float
  field :hum,  :float

end
