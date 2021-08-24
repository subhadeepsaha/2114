# The name of this view in Looker is "Hundred Million Orders Wide"
view: hundred_million_orders_wide {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.hundred_million_orders_wide ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer ID" in Explore.

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_price {
    type: number
    sql: ${TABLE}.order_price ;;
  }

  dimension: test1 {
    type: number
    sql: ${TABLE}.test1 ;;
  }

  dimension: test10 {
    type: number
    sql: ${TABLE}.test10 ;;
  }

  dimension: test11 {
    type: number
    sql: ${TABLE}.test11 ;;
  }

  dimension: test12 {
    type: number
    sql: ${TABLE}.test12 ;;
  }

  dimension: test13 {
    type: number
    sql: ${TABLE}.test13 ;;
  }

  dimension: test14 {
    type: number
    sql: ${TABLE}.test14 ;;
  }

  dimension: test15 {
    type: number
    sql: ${TABLE}.test15 ;;
  }

  dimension: test16 {
    type: number
    sql: ${TABLE}.test16 ;;
  }

  dimension: test17 {
    type: number
    sql: ${TABLE}.test17 ;;
  }

  dimension: test18 {
    type: number
    sql: ${TABLE}.test18 ;;
  }

  dimension: test19 {
    type: number
    sql: ${TABLE}.test19 ;;
  }

  dimension: test2 {
    type: number
    sql: ${TABLE}.test2 ;;
  }

  dimension: test20 {
    type: number
    sql: ${TABLE}.test20 ;;
  }

  dimension: test21 {
    type: number
    sql: ${TABLE}.test21 ;;
  }

  dimension: test22 {
    type: number
    sql: ${TABLE}.test22 ;;
  }

  dimension: test23 {
    type: number
    sql: ${TABLE}.test23 ;;
  }

  dimension: test24 {
    type: number
    sql: ${TABLE}.test24 ;;
  }

  dimension: test25 {
    type: number
    sql: ${TABLE}.test25 ;;
  }

  dimension: test26 {
    type: number
    sql: ${TABLE}.test26 ;;
  }

  dimension: test27 {
    type: number
    sql: ${TABLE}.test27 ;;
  }

  dimension: test28 {
    type: number
    sql: ${TABLE}.test28 ;;
  }

  dimension: test29 {
    type: number
    sql: ${TABLE}.test29 ;;
  }

  dimension: test3 {
    type: number
    sql: ${TABLE}.test3 ;;
  }

  dimension: test30 {
    type: number
    sql: ${TABLE}.test30 ;;
  }

  dimension: test31 {
    type: number
    sql: ${TABLE}.test31 ;;
  }

  dimension: test32 {
    type: number
    sql: ${TABLE}.test32 ;;
  }

  dimension: test33 {
    type: number
    sql: ${TABLE}.test33 ;;
  }

  dimension: test34 {
    type: number
    sql: ${TABLE}.test34 ;;
  }

  dimension: test35 {
    type: number
    sql: ${TABLE}.test35 ;;
  }

  dimension: test36 {
    type: number
    sql: ${TABLE}.test36 ;;
  }

  dimension: test37 {
    type: number
    sql: ${TABLE}.test37 ;;
  }

  dimension: test38 {
    type: number
    sql: ${TABLE}.test38 ;;
  }

  dimension: test39 {
    type: number
    sql: ${TABLE}.test39 ;;
  }

  dimension: test4 {
    type: number
    sql: ${TABLE}.test4 ;;
  }

  dimension: test40 {
    type: number
    sql: ${TABLE}.test40 ;;
  }

  dimension: test41 {
    type: number
    sql: ${TABLE}.test41 ;;
  }

  dimension: test42 {
    type: number
    sql: ${TABLE}.test42 ;;
  }

  dimension: test43 {
    type: number
    sql: ${TABLE}.test43 ;;
  }

  dimension: test44 {
    type: number
    sql: ${TABLE}.test44 ;;
  }

  dimension: test45 {
    type: number
    sql: ${TABLE}.test45 ;;
  }

  dimension: test46 {
    type: number
    sql: ${TABLE}.test46 ;;
  }

  dimension: test47 {
    type: number
    sql: ${TABLE}.test47 ;;
  }

  dimension: test48 {
    type: number
    sql: ${TABLE}.test48 ;;
  }

  dimension: test49 {
    type: number
    sql: ${TABLE}.test49 ;;
  }

  dimension: test5 {
    type: number
    sql: ${TABLE}.test5 ;;
  }

  dimension: test50 {
    type: number
    sql: ${TABLE}.test50 ;;
  }

  dimension: test6 {
    type: number
    sql: ${TABLE}.test6 ;;
  }

  dimension: test7 {
    type: number
    sql: ${TABLE}.test7 ;;
  }

  dimension: test8 {
    type: number
    sql: ${TABLE}.test8 ;;
  }

  dimension: test9 {
    type: number
    sql: ${TABLE}.test9 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [orders.id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_order_price {
    type: sum
    hidden: yes
    sql: ${order_price} ;;
  }

  measure: average_order_price {
    type: average
    hidden: yes
    sql: ${order_price} ;;
  }

  measure: total_test1 {
    type: sum
    hidden: yes
    sql: ${test1} ;;
  }

  measure: average_test1 {
    type: average
    hidden: yes
    sql: ${test1} ;;
  }

  measure: total_test10 {
    type: sum
    hidden: yes
    sql: ${test10} ;;
  }

  measure: average_test10 {
    type: average
    hidden: yes
    sql: ${test10} ;;
  }

  measure: total_test11 {
    type: sum
    hidden: yes
    sql: ${test11} ;;
  }

  measure: average_test11 {
    type: average
    hidden: yes
    sql: ${test11} ;;
  }

  measure: total_test12 {
    type: sum
    hidden: yes
    sql: ${test12} ;;
  }

  measure: average_test12 {
    type: average
    hidden: yes
    sql: ${test12} ;;
  }

  measure: total_test13 {
    type: sum
    hidden: yes
    sql: ${test13} ;;
  }

  measure: average_test13 {
    type: average
    hidden: yes
    sql: ${test13} ;;
  }

  measure: total_test14 {
    type: sum
    hidden: yes
    sql: ${test14} ;;
  }

  measure: average_test14 {
    type: average
    hidden: yes
    sql: ${test14} ;;
  }

  measure: total_test15 {
    type: sum
    hidden: yes
    sql: ${test15} ;;
  }

  measure: average_test15 {
    type: average
    hidden: yes
    sql: ${test15} ;;
  }

  measure: total_test16 {
    type: sum
    hidden: yes
    sql: ${test16} ;;
  }

  measure: average_test16 {
    type: average
    hidden: yes
    sql: ${test16} ;;
  }

  measure: total_test17 {
    type: sum
    hidden: yes
    sql: ${test17} ;;
  }

  measure: average_test17 {
    type: average
    hidden: yes
    sql: ${test17} ;;
  }

  measure: total_test18 {
    type: sum
    hidden: yes
    sql: ${test18} ;;
  }

  measure: average_test18 {
    type: average
    hidden: yes
    sql: ${test18} ;;
  }

  measure: total_test19 {
    type: sum
    hidden: yes
    sql: ${test19} ;;
  }

  measure: average_test19 {
    type: average
    hidden: yes
    sql: ${test19} ;;
  }

  measure: total_test2 {
    type: sum
    hidden: yes
    sql: ${test2} ;;
  }

  measure: average_test2 {
    type: average
    hidden: yes
    sql: ${test2} ;;
  }

  measure: total_test20 {
    type: sum
    hidden: yes
    sql: ${test20} ;;
  }

  measure: average_test20 {
    type: average
    hidden: yes
    sql: ${test20} ;;
  }

  measure: total_test21 {
    type: sum
    hidden: yes
    sql: ${test21} ;;
  }

  measure: average_test21 {
    type: average
    hidden: yes
    sql: ${test21} ;;
  }

  measure: total_test22 {
    type: sum
    hidden: yes
    sql: ${test22} ;;
  }

  measure: average_test22 {
    type: average
    hidden: yes
    sql: ${test22} ;;
  }

  measure: total_test23 {
    type: sum
    hidden: yes
    sql: ${test23} ;;
  }

  measure: average_test23 {
    type: average
    hidden: yes
    sql: ${test23} ;;
  }

  measure: total_test24 {
    type: sum
    hidden: yes
    sql: ${test24} ;;
  }

  measure: average_test24 {
    type: average
    hidden: yes
    sql: ${test24} ;;
  }

  measure: total_test25 {
    type: sum
    hidden: yes
    sql: ${test25} ;;
  }

  measure: average_test25 {
    type: average
    hidden: yes
    sql: ${test25} ;;
  }

  measure: total_test26 {
    type: sum
    hidden: yes
    sql: ${test26} ;;
  }

  measure: average_test26 {
    type: average
    hidden: yes
    sql: ${test26} ;;
  }

  measure: total_test27 {
    type: sum
    hidden: yes
    sql: ${test27} ;;
  }

  measure: average_test27 {
    type: average
    hidden: yes
    sql: ${test27} ;;
  }

  measure: total_test28 {
    type: sum
    hidden: yes
    sql: ${test28} ;;
  }

  measure: average_test28 {
    type: average
    hidden: yes
    sql: ${test28} ;;
  }

  measure: total_test29 {
    type: sum
    hidden: yes
    sql: ${test29} ;;
  }

  measure: average_test29 {
    type: average
    hidden: yes
    sql: ${test29} ;;
  }

  measure: total_test3 {
    type: sum
    hidden: yes
    sql: ${test3} ;;
  }

  measure: average_test3 {
    type: average
    hidden: yes
    sql: ${test3} ;;
  }

  measure: total_test30 {
    type: sum
    hidden: yes
    sql: ${test30} ;;
  }

  measure: average_test30 {
    type: average
    hidden: yes
    sql: ${test30} ;;
  }

  measure: total_test31 {
    type: sum
    hidden: yes
    sql: ${test31} ;;
  }

  measure: average_test31 {
    type: average
    hidden: yes
    sql: ${test31} ;;
  }

  measure: total_test32 {
    type: sum
    hidden: yes
    sql: ${test32} ;;
  }

  measure: average_test32 {
    type: average
    hidden: yes
    sql: ${test32} ;;
  }

  measure: total_test33 {
    type: sum
    hidden: yes
    sql: ${test33} ;;
  }

  measure: average_test33 {
    type: average
    hidden: yes
    sql: ${test33} ;;
  }

  measure: total_test34 {
    type: sum
    hidden: yes
    sql: ${test34} ;;
  }

  measure: average_test34 {
    type: average
    hidden: yes
    sql: ${test34} ;;
  }

  measure: total_test35 {
    type: sum
    hidden: yes
    sql: ${test35} ;;
  }

  measure: average_test35 {
    type: average
    hidden: yes
    sql: ${test35} ;;
  }

  measure: total_test36 {
    type: sum
    hidden: yes
    sql: ${test36} ;;
  }

  measure: average_test36 {
    type: average
    hidden: yes
    sql: ${test36} ;;
  }

  measure: total_test37 {
    type: sum
    hidden: yes
    sql: ${test37} ;;
  }

  measure: average_test37 {
    type: average
    hidden: yes
    sql: ${test37} ;;
  }

  measure: total_test38 {
    type: sum
    hidden: yes
    sql: ${test38} ;;
  }

  measure: average_test38 {
    type: average
    hidden: yes
    sql: ${test38} ;;
  }

  measure: total_test39 {
    type: sum
    hidden: yes
    sql: ${test39} ;;
  }

  measure: average_test39 {
    type: average
    hidden: yes
    sql: ${test39} ;;
  }

  measure: total_test4 {
    type: sum
    hidden: yes
    sql: ${test4} ;;
  }

  measure: average_test4 {
    type: average
    hidden: yes
    sql: ${test4} ;;
  }

  measure: total_test40 {
    type: sum
    hidden: yes
    sql: ${test40} ;;
  }

  measure: average_test40 {
    type: average
    hidden: yes
    sql: ${test40} ;;
  }

  measure: total_test41 {
    type: sum
    hidden: yes
    sql: ${test41} ;;
  }

  measure: average_test41 {
    type: average
    hidden: yes
    sql: ${test41} ;;
  }

  measure: total_test42 {
    type: sum
    hidden: yes
    sql: ${test42} ;;
  }

  measure: average_test42 {
    type: average
    hidden: yes
    sql: ${test42} ;;
  }

  measure: total_test43 {
    type: sum
    hidden: yes
    sql: ${test43} ;;
  }

  measure: average_test43 {
    type: average
    hidden: yes
    sql: ${test43} ;;
  }

  measure: total_test44 {
    type: sum
    hidden: yes
    sql: ${test44} ;;
  }

  measure: average_test44 {
    type: average
    hidden: yes
    sql: ${test44} ;;
  }

  measure: total_test45 {
    type: sum
    hidden: yes
    sql: ${test45} ;;
  }

  measure: average_test45 {
    type: average
    hidden: yes
    sql: ${test45} ;;
  }

  measure: total_test46 {
    type: sum
    hidden: yes
    sql: ${test46} ;;
  }

  measure: average_test46 {
    type: average
    hidden: yes
    sql: ${test46} ;;
  }

  measure: total_test47 {
    type: sum
    hidden: yes
    sql: ${test47} ;;
  }

  measure: average_test47 {
    type: average
    hidden: yes
    sql: ${test47} ;;
  }

  measure: total_test48 {
    type: sum
    hidden: yes
    sql: ${test48} ;;
  }

  measure: average_test48 {
    type: average
    hidden: yes
    sql: ${test48} ;;
  }

  measure: total_test49 {
    type: sum
    hidden: yes
    sql: ${test49} ;;
  }

  measure: average_test49 {
    type: average
    hidden: yes
    sql: ${test49} ;;
  }

  measure: total_test5 {
    type: sum
    hidden: yes
    sql: ${test5} ;;
  }

  measure: average_test5 {
    type: average
    hidden: yes
    sql: ${test5} ;;
  }

  measure: total_test50 {
    type: sum
    hidden: yes
    sql: ${test50} ;;
  }

  measure: average_test50 {
    type: average
    hidden: yes
    sql: ${test50} ;;
  }

  measure: total_test6 {
    type: sum
    hidden: yes
    sql: ${test6} ;;
  }

  measure: average_test6 {
    type: average
    hidden: yes
    sql: ${test6} ;;
  }

  measure: total_test7 {
    type: sum
    hidden: yes
    sql: ${test7} ;;
  }

  measure: average_test7 {
    type: average
    hidden: yes
    sql: ${test7} ;;
  }

  measure: total_test8 {
    type: sum
    hidden: yes
    sql: ${test8} ;;
  }

  measure: average_test8 {
    type: average
    hidden: yes
    sql: ${test8} ;;
  }

  measure: total_test9 {
    type: sum
    hidden: yes
    sql: ${test9} ;;
  }

  measure: average_test9 {
    type: average
    hidden: yes
    sql: ${test9} ;;
  }
}
