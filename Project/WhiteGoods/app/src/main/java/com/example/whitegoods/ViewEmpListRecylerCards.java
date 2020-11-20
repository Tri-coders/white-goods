// Inventory Detail Recycler Adapter
package com.example.whitegoods;
public class ViewEmpListRecylerCards {
    private String mUserId, mImageResource, mName, mRole;
    private String mEmail, mPhone, mAddress, mCity, mPin;

    public ViewEmpListRecylerCards(String UserId, String imageResource, String name, String role, String email, String phone, String address, String city, String pin) {
        mUserId = UserId;
        mImageResource = imageResource;
        mName = name;
        mRole = role;
        mEmail = email;
        mPhone = phone;
        mAddress = address;
        mCity = city;
        mPin = pin;
    }

    public String getUserId() { return mUserId; }

    public String getImageResource() {
        return mImageResource;
    }

    public String getName() {
        return mName;
    }

    public String getRole() {
        return mRole;
    }

    public String getEmail() { return mEmail; }

    public String getPhone() { return mPhone; }

    public String getAddress() { return mAddress; }

    public String getCity() { return mCity; }

    public String getPin() { return mPin; }
}
