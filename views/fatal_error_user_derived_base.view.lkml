# The name of this view in Looker is "Fatal Error User Derived Base"
view: fatal_error_user_derived_base {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.FATAL_ERROR_user_derived_base ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Users Count" in Explore.

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_users_count {
    type: sum
    hidden: yes
    sql: ${users_count} ;;
  }

  measure: average_users_count {
    type: average
    hidden: yes
    sql: ${users_count} ;;
  }
}
