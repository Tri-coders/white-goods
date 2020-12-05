package com.example.whitegoods;

public class RequestCard {
    private String mRequestId;
    private String mRequestTitle;
    private String mEmployeeName;
    private String mDate;
    private String mTime;
    private String mLocation;

    public RequestCard(String RequestId, String RequestTitle, String EmpName, String Date, String Time, String Location) {
        mRequestId = RequestId;
        mRequestTitle = RequestTitle;
        mEmployeeName = EmpName;
        mDate = Date;
        mTime = Time;
        mLocation = Location;
    }

    public String getRequestId() {
        return mRequestId;
    }

    public String getRequestTitle() {
        return mRequestTitle;
    }

    public String getEmpName() {
        return mEmployeeName;
    }

    public String getDate() {
        return mDate;
    }

    public String getTime() {
        return mTime;
    }

    public String getLocation() {
        return mLocation;
    }
}
