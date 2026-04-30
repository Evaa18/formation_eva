# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bike.order_items` ;;
  drill_fields: [item_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.item_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Discount" in Explore.

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: list_price {
    type: number
    sql: ${TABLE}.list_price ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  measure: count {
    type: count
    drill_fields: [item_id, orders.order_id]
  }
}
