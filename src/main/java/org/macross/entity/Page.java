package org.macross.entity;

import java.util.List;

public class Page {
    //	当前页  currentPage
    private int currentPage;
    //	页面大小 pageSize
    private int pageSize ;

    //	总数据 totalCount
    private int totalCount;
    //	总页数   totalPage
    private int totalPage ;

    private int startId;
    

//	当前页的数据集合  apple

    private List<apple> apples;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<apple> getApples() {
        return apples;
    }

    public void setApples(List<apple> apples) {
        this.apples = apples;
    }

    public int getStartId() {
        return startId;
    }

    public void setStartId(int startId) {
        this.startId = startId;
    }


}
