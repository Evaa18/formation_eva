# The name of this view in Looker is "Stocks"
view: stocks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bike.stocks` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Product ID" in Explore.

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }
  measure: count {
    type: count
    drill_fields: [stores.store_id, stores.store_name]
  }
}
