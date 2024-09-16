#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

pick_service(){
$PSQL "SELECT * FROM services;" | while IFS="|" read -r service_id name
do
    echo "$service_id) $name"
done


read SERVICE_ID_SELECTED

if [[ $SERVICE_ID_SELECTED =~ ^-?[0-9]+$ ]]; then
  result=$($PSQL "SELECT * FROM services where service_id=$SERVICE_ID_SELECTED;")

  # Check if the result is empty
  if [[ -z "$result" ]]; then
      pick_service
  else
      # Process the result if it's not empty
      echo "$result" | while IFS="|" read -r service_id name
      do
          echo "Picked service id: $service_id, name: $name"
      done
  fi
else
  pick_service
fi
}

pick_service

echo "Enter your phone number"
read CUSTOMER_PHONE

NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$(echo $NAME | sed 's/ //g')
  if [[ -z $NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    NAME=$(echo $NAME | sed 's/ //g')
    SAVED_TO_TABLE_CUSTOMERS=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi
  
  GET_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_NAME=$(echo $GET_SERVICE_NAME)
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  SAVED_TO_TABLE_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $SAVED_TO_TABLE_APPOINTMENTS == "INSERT 0 1" ]]
  then
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi


exit