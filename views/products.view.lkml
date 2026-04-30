# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bike.products` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Available Colors Colors Blue" in Explore.

  dimension: available_colors__colors__blue {
    type: yesno
    sql: ${TABLE}.available_colors.colors.blue ;;
    group_label: "Available Colors Colors"
    group_item_label: "Blue"
  }

  dimension: available_colors__colors__green {
    type: yesno
    sql: ${TABLE}.available_colors.colors.green ;;
    group_label: "Available Colors Colors"
    group_item_label: "Green"
  }

  dimension: available_colors__colors__red {
    type: yesno
    sql: ${TABLE}.available_colors.colors.red ;;
    group_label: "Available Colors Colors"
    group_item_label: "Red"
  }

  dimension: available_colors__shiny {
    type: yesno
    sql: ${TABLE}.available_colors.shiny ;;
    group_label: "Available Colors"
    group_item_label: "Shiny"
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: list_price {
    type: number
    sql: ${TABLE}.list_price ;;
  }

  dimension: model_year {
    type: number
    sql: ${TABLE}.model_year ;;
  }

  dimension: model_year_old {
    type: number
    sql: ${TABLE}.model_year_old ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: purchase_price {
    type: number
    sql: ${TABLE}.purchase_price ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: type_customization {
    type: string
    sql: ${TABLE}.type_customization ;;
  }

  dimension: type_customization_json {
    type: string
    sql: ${TABLE}.type_customization_json ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}

# The name of this view in Looker is "Products Tags"
view: products__tags {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products Tags" in Explore.

  dimension: products__tags {
    type: string
    sql: products__tags ;;
  }
}
