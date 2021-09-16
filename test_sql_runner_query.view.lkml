view: test_sql_runner_query {
  derived_table: {
    sql: SELECT
          (YEAR(CONVERT_TZ(`orders`.`created_at`,'UTC','Asia/Calcutta'))) AS `orders.created_year`,
          `orders`.`status` AS `orders.status`
      FROM
          `demo_db`.`order_items` AS `order_items`
          LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
      GROUP BY
          1,
          2
      ORDER BY
          (YEAR(CONVERT_TZ(`orders`.`created_at`,'UTC','Asia/Calcutta'))) DESC
      LIMIT 200
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_created_year {
    type: number
    sql: ${TABLE}.`orders.created_year` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  set: detail {
    fields: [orders_created_year, orders_status]
  }
}
