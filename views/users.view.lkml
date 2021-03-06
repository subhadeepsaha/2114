# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.users ;;
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
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city;;
    link : {
      label: "Drill by City"
      url: "https://lookerv2114.dev.looker.com/explore/ecommerce_saha/order_items?qid=8zL4CCqNhQWGo35h50Jf0a&origin_space=89&toggle=vis&f[users.city]={{ value }}&pivots=users.state"
    }
  }
  dimension: NewCity {
    sql: CASE WHEN ${city}='New York' THEN 'New'
  ELSE ${city} END ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  filter: product_filter {
    type: string
    suggest_dimension: product_name_suggest
    # suggest_persist_for: "0 minutes"
    sql: {% condition product_filter %} ${product_name_suggest} {% endcondition %} ;;
  }

  dimension: product_name_suggest {
    label: "Product"
    type: string
    can_filter: yes
    sql: CASE WHEN ${TABLE}.city = "ABC" THEN ${city} ELSE null END ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: ageTier {
    type: tier
    style: integer
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80,90]
    sql: ${age} ;;
  }
dimension: month_formatted {
  group_label: "Created" label: "Month"
  sql: ${created_month} ;;
  html: {{ rendered_value | append: "-01" | date: "%b'%y" }};;
}
  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_age {
    type: sum
    hidden: yes
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    hidden: yes
    sql: ${age} ;;
  }
  measure: average {
    type: number
    sql: ${count}/${inventory_items.count} ;;
  }

  dimension: Past30 {
    type: date
    sql:  CAST(${created_date} AS DATE) - INTERVAL 30 day ;;
  }

  dimension: date_1 {
    type: date
    sql: (CAST(${created_date} AS DATE) - INTERVAL 0 year) - INTERVAL 30 day ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
