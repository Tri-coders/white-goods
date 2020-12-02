package com.example.whitegoods;

public class InventoryCards {

    private String mProductImage;
    private String mProductName;
    private String mProductPrice;
    private String mProductQuantity;

    public InventoryCards(String prodUrl, String prodName, String prodPrice, String prodQuantity) {
        mProductImage = prodUrl;
        mProductName = prodName;
        mProductPrice = prodPrice;
        mProductQuantity = prodQuantity;
    }

    public String getProdUrl() {
        return mProductImage;
    }

    public String getProdName() {
        return mProductName;
    }

    public String getProdPrice() {
        return mProductPrice;
    }

    public String getProdQuantity() {
        return mProductQuantity;
    }
}
