module ApplicationHelper
  require 'bigdecimal'
  
  def calc_sub_total(line_item)
    @line_item_sub_total = line_item.quantity * line_item.item.price
  end
  
  def calc_total(order)
    @total = 0
    order.line_items.each do |line_item|
      @total += calc_sub_total(line_item)
    end
    return @total
  end
  
  def calc_project_total(project)
    @project_total = 0
    project.line_items.each do |line_item|
      @project_total += calc_sub_total(line_item)
    end
    return @project_total
  end
  
  def calc_paid_total(order)
    @paid_total = 0
    order.line_items.each do |line_item|
      if line_item.paid
        @paid_total += line_item.paid
      end
    end
    return @paid_total
  end
  
  def calc_project_paid_total(project)
    @project_paid_total = 0
    project.line_items.each do |line_item|
      if line_item.paid
        @project_paid_total += line_item.paid
      end
    end
    return @project_paid_total
  end
  
end
