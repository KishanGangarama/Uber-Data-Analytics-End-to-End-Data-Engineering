-- Extract all the data and combine it together 

CREATE OR REPLACE TABLE `abstract-ring-391505.uber_data_engineering_yt.tbl_analytics` AS (
  SELECT
    f.VendorID,
    d.tpep_pickup_datetime,
    d.tpep_dropoff_datetime,
    p.passenger_count,
    t.trip_distance,
    r.rate_code_name,
    pick.pickup_latitude,
    pick.pickup_longitude,
    drop.dropoff_latitude,
    drop.dropoff_longitude,
    pay.payment_type_name,
    f.fare_amount,
    f.extra,
    f.mta_tax,
    f.tip_amount,
    f.tolls_amount,
    f.improvement_surcharge,
    f.total_amount
  FROM
    `abstract-ring-391505.uber_data_engineering_yt.fact_table` f
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.datetime_dim` d ON f.datetime_id = d.datetime_id
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.passenger_count_dim` p ON p.passenger_count_id = f.passenger_count_id
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.trip_distance_dim` t ON t.trip_distance_id = f.trip_distance_id
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.rate_code_dim` r ON r.rate_code_id = f.rate_code_id
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.pickup_location_dim` pick ON pick.pickup_location_id = f.pickup_location_id
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.dropoff_location_dim` drop ON drop.dropoff_location_id = f.dropoff_location_id
  JOIN
    `abstract-ring-391505.uber_data_engineering_yt.payment_type_dim` pay ON pay.payment_type_id = f.payment_type_id
);


-- Finding average fare amount based on VendorID

SELECT
  VendorID,
  AVG(fare_amount) AS average_fare_amount
FROM
  `abstract-ring-391505.uber_data_engineering_yt.fact_table`
GROUP BY
  VendorID;


-- Finding average tips based on the payment type 

SELECT
  b.payment_type_name,
  AVG(a.tip_amount) AS average_tip_amount
FROM
  `abstract-ring-391505.uber_data_engineering_yt.fact_table` AS a
JOIN
  `abstract-ring-391505.uber_data_engineering_yt.payment_type_dim` AS b
ON
  a.payment_type_id = b.payment_type_id
GROUP BY
  b.payment_type_name;


-- Finding the top 10 pickup locations based on the number of trips

SELECT
  pickup_location_id,
  COUNT(*) AS trip_count
FROM
  `abstract-ring-391505.uber_data_engineering_yt.fact_table`
GROUP BY
  pickup_location_id
ORDER BY
  trip_count DESC
LIMIT
  10;


-- Finding the total number of trips by passenger count

SELECT p.passenger_count, COUNT(*) AS total_trips
FROM `abstract-ring-391505.uber_data_engineering_yt.fact_table` f
JOIN `abstract-ring-391505.uber_data_engineering_yt.passenger_count_dim` p
    ON f.passenger_count_id = p.passenger_count_id
GROUP BY p.passenger_count;


-- Find the average fare amount by hour of the day

SELECT
    d.pick_hour,
    AVG(f.fare_amount) AS average_fare_amount
FROM
    `abstract-ring-391505.uber_data_engineering_yt.fact_table` f
JOIN
    `abstract-ring-391505.uber_data_engineering_yt.datetime_dim` d
    ON f.datetime_id = d.datetime_id
GROUP BY
    pick_hour
ORDER BY
    pick_hour;
