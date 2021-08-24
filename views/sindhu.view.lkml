# The name of this view in Looker is "Sindhu"
view: sindhu {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.sindhu ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Balance" in Explore.

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: balance_lag {
    type: number
    sql: ${TABLE}.balance_lag ;;
  }

  dimension: funding_amount {
    type: number
    sql: ${TABLE}.funding_amount ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: funding {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.funding_time ;;
  }

  dimension: p_key {
    type: number
    sql: ${TABLE}.p_key ;;
  }

  dimension: purchase_key {
    type: number
    sql: ${TABLE}.purchase_key ;;
  }

  dimension: purchase_key_temp {
    type: number
    sql: ${TABLE}.purchase_key_temp ;;
  }

  dimension_group: purchase {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.purchase_time ;;
  }

  dimension: spotme_purchase_amount {
    type: number
    sql: ${TABLE}.spotme_purchase_amount ;;
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
    drill_fields: [users.id, users.first_name, users.last_name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_balance {
    type: sum
    hidden: yes
    sql: ${balance} ;;
  }

  measure: average_balance {
    type: average
    hidden: yes
    sql: ${balance} ;;
  }

  measure: total_balance_lag {
    type: sum
    hidden: yes
    sql: ${balance_lag} ;;
  }

  measure: average_balance_lag {
    type: average
    hidden: yes
    sql: ${balance_lag} ;;
  }

  measure: total_funding_amount {
    type: sum
    hidden: yes
    sql: ${funding_amount} ;;
  }

  measure: average_funding_amount {
    type: average
    hidden: yes
    sql: ${funding_amount} ;;
  }

  measure: total_p_key {
    type: sum
    hidden: yes
    sql: ${p_key} ;;
  }

  measure: average_p_key {
    type: average
    hidden: yes
    sql: ${p_key} ;;
  }

  measure: total_purchase_key {
    type: sum
    hidden: yes
    sql: ${purchase_key} ;;
  }

  measure: average_purchase_key {
    type: average
    hidden: yes
    sql: ${purchase_key} ;;
  }

  measure: total_purchase_key_temp {
    type: sum
    hidden: yes
    sql: ${purchase_key_temp} ;;
  }

  measure: average_purchase_key_temp {
    type: average
    hidden: yes
    sql: ${purchase_key_temp} ;;
  }

  measure: total_spotme_purchase_amount {
    type: sum
    hidden: yes
    sql: ${spotme_purchase_amount} ;;
  }

  measure: average_spotme_purchase_amount {
    type: average
    hidden: yes
    sql: ${spotme_purchase_amount} ;;
  }
}
