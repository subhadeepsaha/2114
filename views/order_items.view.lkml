# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.order_items ;;
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
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: Usformat {
    type: number
    value_format: "0.00\%"
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: Millions {
    type: number
    value_format:  "0.000,,\" M\""
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: month_num{
    type: number
    sql: (DATE_FORMAT(CONVERT_TZ(`returned_at`,'UTC','Asia/Calcutta'),'%m')) ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension: Past30 {
    type: date
    sql:  CAST(${returned_date} AS DATE) - INTERVAL 30 day ;;
  }

  dimension: date_1 {
    type: date
    sql: (CAST(${returned_date} AS DATE) - INTERVAL 30 day) - INTERVAL 1 year - INTERVAL 1 day ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: average_sale_price {
    type: average
    hidden: yes
    sql: ${sale_price} ;;
  }
  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "month"
    }
  }

  dimension: date {
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${returned_date}
    {% else date_granularity._parameter_value == 'month' %}
      ${date_1}
    {% endif %};;
  }
  parameter: Format1{
    type: unquoted
    allowed_value: {
      label: "US format"
      value: "US"
    }
    allowed_value: {
      label: "Millions"
      value: "MI"
    }
  }

  dimension: Format {
    sql:
    {% if Format1._parameter_value == 'US' %}
      ${Usformat}
    {% else Format1._parameter_value == 'MI' %}
      ${Millions}
    {% endif %};;
  }
}
