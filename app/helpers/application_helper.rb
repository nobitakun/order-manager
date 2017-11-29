module ApplicationHelper
  
  def sidebar_activate(link)
    current_url = request.headers['PATH_INFO']
    if current_url.match(link)
      ' active"'
    else
      ''
    end
  end
  
  def sidebar_list_items
    items = [
      { text: '部材カテゴリー管理', path: item_categories_path },
      { text: '部材管理', path: items_path },
      { text: '発注先管理', path: partners_path },
      { text: '顧客管理', path: projects_path }
    ]
      
    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html += %Q(<li class="nav-item"><a href="#{path}" class="nav-link#{sidebar_activate(path)}">#{text}</a></li>)
    end
      
    raw(html)
  end
        
  def calc_sub_total(line_item)
    @line_item_sub_total = line_item.quantity * line_item.unit_price
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
  
  def calc_project_discount(project)
    @project_discount = 0
    project.orders.each do |order|
      if order.discount
        @project_discount += order.discount
      end
    end
    return @project_discount
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
