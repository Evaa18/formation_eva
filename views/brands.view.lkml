# The name of this view in Looker is "Brands"
view: brands {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bike.brands` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand ID" in Explore.

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }
  measure: count {
    type: count
    drill_fields: [brand_name]
  }
}
