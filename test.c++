#include <time.h>
#include <string>

using namespace std;

class RestaurantPortal {
private: 
    int orderId;
public:
    time_t time_of_reservation;
    Order order_type;

    int getOrder(Order the_order){
        // a function to get an order from the customer and returns an unique id for this order
        this->order_type = the_order;
        return orderId;
    }

    void deliver_order(){
        // a function to deliver the order to the specific id 
    }

    time_t time_of_waiting(){
        // this function returns the time of waiting for the next order to be delivered on the dashboard
    }

    time_t time_for_specific_order(int order_id){
        // this function should return the time of waiting for specific order id
    }

    bool is_available()
    {
        // this function should return true if the portal is ready to accept their order
        // and false if not
    }
};

class Order {
private:
    string dish_name;
    double price;
    Client the_client;
};

class Client {
public:
    string name;
    int table_id;
};