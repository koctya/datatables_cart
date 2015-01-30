class OrderDatatable < AjaxDatatablesRails::Base
#class OrderDatatable
  include AjaxDatatablesRails::Extensions::WillPaginate

  #delegate :params, :h, :link_to, :number_to_currency, to: :@view
  def_delegators :@view, :link_to, :h, :number_to_currency


  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    columns = %w[Order.id Order::LineItem::Product.name Order::User.name Order::User.address Order::User.payment Order.created_at]

    @sortable_columns ||= columns
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    columns = %w[Order.id Order::LineItem::Product.name Order::User.name Order::User.address Order::User.payment Order.created_at]

    @searchable_columns ||= columns
  end

  private

  def data
    #binding.pry
    records.map do |order|
      [
        link_to(order.id, order),
        product_list(order),
        total_price(order),
        order.user.name,
        order.user.address,
        order.user.payment,
        order.created_at.strftime("%d %B %Y at %I:%M%p")
      ]
    end
  end

  def product_list(order)
    pnames = [];
    order.line_items.each {|item| pnames << item.product.name rescue "" }
    pnames.join(' - ')
  end

  def total_price(order)
    total = order.line_items.reduce(0) do |sum, item|
      sum += item.product.price rescue 0
    end
    number_to_currency(total)
  end

  def get_raw_records
    # insert query here
    Order.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
    def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
