# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.products ;;
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
  # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    hidden: yes
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }


  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: brand_logo {
    type: string
    sql: ${brand} ;;
    html:
        {% if brand._value == "O'Neill" %}
        <img src="https://upload.wikimedia.org/wikipedia/en/thumb/1/1b/O%27Neill_%28brand%29_logo.svg/220px-O%27Neill_%28brand%29_logo.svg.png">
        {% elsif brand._value == "Calvin Klein" %}
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Calvin_klein_logo.svg/220px-Calvin_klein_logo.svg.png">
        {% elsif brand._value == "Hanes" %}
        <img src="https://upload.wikimedia.org/wikipedia/en/thumb/f/f0/Hanes-logo.svg/150px-Hanes-logo.svg.png">
        {% elsif brand._value == "Tommy Hilfiger"%}
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tommy_hilfig_vectorlogo.svg/250px-Tommy_hilfig_vectorlogo.svg.png">
        {% else %}
        <img src="https://icon-library.net/images/no-image-available-icon/no-image-available-icon-6.jpg" height="250" width="300">
        {% endif %} ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id, item_name, inventory_items.count]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_rank {
    type: sum
    hidden: yes
    sql: ${rank} ;;
  }

  measure: average_rank {
    type: average
    hidden: yes
    sql: ${rank} ;;
  }

  measure: total_retail_price {
    type: sum
    hidden: no
    sql: ${retail_price} ;;
    value_format_name: usd
  }

  measure: average_retail_price {
    type: average
    hidden: yes
    sql: ${retail_price} ;;
  }
}
