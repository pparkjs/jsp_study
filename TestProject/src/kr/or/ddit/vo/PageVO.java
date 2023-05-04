package kr.or.ddit.vo;

public class PageVO {
	//한 페이지 내의 게시글의 시작과 끝
	private int start;
	private int end;		
	
	//한 화면에 보이는 페이지의 시작과 끝
	private int startPageNum;
	private int endPageNum;
	private int totalPageNum; //전체 페이지 수 (마지막 페이지 수로 봐두 됨)
	private int totalCount; //전체 게시글 수
	private int culPageNum;  //현재 내가 있는 페이지번호
	
	private static int perList = 5; //한 페이지에 출력될 게시글 수
	private static int perPage = 4; //한 화면에 보이는 페이지 수
	
	private String sword;
	private String stype;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCulPageNum() {
		return culPageNum;
	}
	public void setCulPageNum(int culPageNum) {
		this.culPageNum = culPageNum;
	}
	public static int getPerList() {
		return perList;
	}
	public static void setPerList(int perList) {
		PageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		PageVO.perPage = perPage;
	}
	public String getSword() {
		return sword;
	}
	public void setSword(String sword) {
		this.sword = sword;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	
	
	
}
