# The name of this view in Looker is "Flights"
view: flights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.flights ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Arr Delay" in Explore.

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: arr {
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
    sql: ${TABLE}.arr_time ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension_group: dep {
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
    sql: ${TABLE}.dep_time ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }

  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }

  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
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

  measure: total_arr_delay {
    type: sum
    hidden: yes
    sql: ${arr_delay} ;;
  }

  measure: average_arr_delay {
    type: average
    hidden: yes
    sql: ${arr_delay} ;;
  }

  measure: total_dep_delay {
    type: sum
    hidden: yes
    sql: ${dep_delay} ;;
  }

  measure: average_dep_delay {
    type: average
    hidden: yes
    sql: ${dep_delay} ;;
  }

  measure: total_distance {
    type: sum
    hidden: yes
    sql: ${distance} ;;
  }

  measure: average_distance {
    type: average
    hidden: yes
    sql: ${distance} ;;
  }

  measure: total_flight_time {
    type: sum
    hidden: yes
    sql: ${flight_time} ;;
  }

  measure: average_flight_time {
    type: average
    hidden: yes
    sql: ${flight_time} ;;
  }

  measure: total_id2 {
    type: sum
    hidden: yes
    sql: ${id2} ;;
  }

  measure: average_id2 {
    type: average
    hidden: yes
    sql: ${id2} ;;
  }

  measure: total_taxi_in {
    type: sum
    hidden: yes
    sql: ${taxi_in} ;;
  }

  measure: average_taxi_in {
    type: average
    hidden: yes
    sql: ${taxi_in} ;;
  }

  measure: total_taxi_out {
    type: sum
    hidden: yes
    sql: ${taxi_out} ;;
  }

  measure: average_taxi_out {
    type: average
    hidden: yes
    sql: ${taxi_out} ;;
  }
}
