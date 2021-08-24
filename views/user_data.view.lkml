# The name of this view in Looker is "User Data"
view: user_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.user_data ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Max Num Orders" in Explore.

  dimension: max_num_orders {
    type: number
    sql: ${TABLE}.max_num_orders ;;
  }

  dimension: total_num_orders {
    type: number
    sql: ${TABLE}.total_num_orders ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_max_num_orders {
    type: sum
    hidden: yes
    sql: ${max_num_orders} ;;
  }

  measure: average_max_num_orders {
    type: average
    hidden: yes
    sql: ${max_num_orders} ;;
  }

  measure: total_total_num_orders {
    type: sum
    hidden: yes
    sql: ${total_num_orders} ;;
  }

  measure: average_total_num_orders {
    type: average
    hidden: yes
    sql: ${total_num_orders} ;;
  }
}
