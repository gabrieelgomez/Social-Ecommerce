module Intranet
  class InventoryControl < ApplicationRecord
    belongs_to :intranet

    # Falta realizar control de inventario de productos, stock, notif por nivel bajo de stock
  end
end
