package org.matrix_soft.sailor.mobile.model;

//import android.content.Context;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;

public class RequestOrder extends Session {

    @Expose @SerializedName("orders") private ArrayList<Order> mOrders;

    public RequestOrder() {}

    /*public RequestOrder(Context appContext) {
        this.setSession(appContext);
    }*/

    public ArrayList<Order> getOrders() {
        return mOrders;
    }

    public void setOrders(ArrayList<Order> orders) {
        mOrders = orders;
    }
}
