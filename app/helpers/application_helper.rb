module ApplicationHelper
  
  def calc_sub_total(line_item)
    @line_item_sub_total = line_item.quantity * line_item.item.price
  end
  
  def calc_total(order)
    order.line_items.first.item.price
  end
  
end
