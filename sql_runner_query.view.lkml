view: sql_runner_query {
  derived_table: {
    sql: SELECT
          products.category  AS `products.category`,
          COUNT(DISTINCT products.id ) AS `products.count`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      LEFT JOIN demo_db.products  AS products ON inventory_items.product_id = products.id
      GROUP BY
          1
      ORDER BY
          products.category
      LIMIT 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: products_category {
    type: string
    sql: ${TABLE}.`products.category` ;;
  }

  measure: products_count {
    type: count
    sql: ${TABLE}.`products.count` ;;
  }

  set: detail {
    fields: [products_category, products_count]
  }
}
