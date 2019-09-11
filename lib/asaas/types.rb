Dry::Types.load_extensions(:maybe)

module Types
  include Dry::Types(default: :nominal)
end