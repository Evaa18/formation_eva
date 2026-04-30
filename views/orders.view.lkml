# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bike.orders` ;;
  drill_fields: [order_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer ID" in Explore.

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: flag_data_test {
    type: yesno
    sql: ${TABLE}.flag_data_test ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension_group: order_date_older {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date_older ;;
  }

  dimension: order_status_id {
    type: number
    sql: ${TABLE}.order_status_id ;;
  }

  dimension_group: required {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.required_date ;;
  }

  dimension_group: required_date_older {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.required_date_older ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_date ;;
  }

  dimension_group: shipped_date_older {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_date_older ;;
  }

  dimension: staff_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.staff_id ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	order_id,
	stores.store_id,
	stores.store_name,
	staffs.staff_id,
	staffs.last_name,
	staffs.first_name,
	customers.last_name,
	customers.customer_id,
	customers.first_name,
	order_items.count
	]
  }

}
