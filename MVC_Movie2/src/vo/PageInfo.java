package vo;

// 페이징 처리를 위한 정보를 저장하는 클래스
public class PageInfo {
	
	private int page;
    private int maxPage;
    private int startPage;
    private int endPage;
    private int listCount;
	private int delivery1_Count;
    private int delivery2_Count;
    private int delivery3_Count;
    private int delivery4_Count;
    
    public PageInfo(int page, int maxPage, int startPage, int endPage, int listCount) {
    	super();
    	this.page = page;
    	this.maxPage = maxPage;
    	this.startPage = startPage;
    	this.endPage = endPage;
    	this.listCount = listCount;
    }
    
    public PageInfo(int page, int maxPage, int startPage, int endPage, int listCount, int delivery1_Count,
    		int delivery2_Count, int delivery3_Count, int delivery4_Count) {
    	super();
    	this.page = page;
    	this.maxPage = maxPage;
    	this.startPage = startPage;
    	this.endPage = endPage;
    	this.listCount = listCount;
    	this.delivery1_Count = delivery1_Count;
    	this.delivery2_Count = delivery2_Count;
    	this.delivery3_Count = delivery3_Count;
    	this.delivery4_Count = delivery4_Count;
    }
    
    public int getDelivery1_Count() {
    	return delivery1_Count;
    }
    
    public void setDelivery1_Count(int delivery1_Count) {
    	this.delivery1_Count = delivery1_Count;
    }
    
    public int getDelivery2_Count() {
    	return delivery2_Count;
    }
    
    public void setDelivery2_Count(int delivery2_Count) {
    	this.delivery2_Count = delivery2_Count;
    }
    
    public int getDelivery3_Count() {
    	return delivery3_Count;
    }
    
    public void setDelivery3_Count(int delivery3_Count) {
    	this.delivery3_Count = delivery3_Count;
    }
    
    public int getDelivery4_Count() {
    	return delivery4_Count;
    }
    
    public void setDelivery4_Count(int delivery4_Count) {
    	this.delivery4_Count = delivery4_Count;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getMaxPage() {
        return maxPage;
    }
    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public int getListCount() {
        return listCount;
    }
    public void setListCount(int listCount) {
        this.listCount = listCount;
    }
    
}
