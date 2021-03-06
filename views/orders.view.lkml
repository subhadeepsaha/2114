# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Status" in Explore.

  dimension: status {
    sql: ${TABLE}.status ;;
    html: {% if value == 'Complete' %}
      <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'Cancelled' %}
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
;;
  }

  dimension: Colorfro{
    html: {% if orders._user_id > 10000 %}
      <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif orders._user_id < 10000 %}
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: is_order_paid {
    type: yesno
    sql: ${status} = 'complete' ;;
  }
  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.age,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
}
