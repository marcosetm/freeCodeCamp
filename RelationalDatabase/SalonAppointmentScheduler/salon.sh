#!/bin/bash
PSQL="psql -X -U freecodecamp -d salon --tuples-only -c"

MAIN_MENU() {
  # if there is a message
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi

  # get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services;")
  echo -e "\nPlease select a service:"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do 
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  
  # get service request
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  
  # check service exists
  if [[ -z $SERVICE_NAME ]]
  then 
    MAIN_MENU "$SERVICE_ID_SELECTED is not a valid choice, please make another selection."
  else
    # get customer info
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    
    # check if customer exists
    if [[ -z $CUSTOMER_NAME ]]
    then
      # insert new customer
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME
      INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
    fi
    #make appointment
    echo -e "\nWhat time would you like your appointment at?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    INSERT_NEW_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/ //') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/ //')."
  fi
}

# start salon
MAIN_MENU "----- WELCOME TO FCC SALON -----"

