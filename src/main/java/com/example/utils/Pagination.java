package com.example.utils;

public class Pagination {

	private int currentPage;   // 요청한 페이지 번호
	private int totalRows;      // 전체 데이터 갯수
   private int rows;         // 한 화면에 표시되는 데이터 갯수
   private int pages;         // 한 화면에 표시되는 페이지번호 갯수
   
   /**
    * 요청한 페이지번호, 전체 데이터 갯수를 전달받아서 Pagination객체를 초기화한다.
    * <p>한 화면에 표시되는 데이터 갯수는 10개다.
    * <p>한 화면에 표시되는 페이지번호 갯수는 5개다.
    * @param currentPage 요청한 페이지 번호
    * @param totalRows 전체 데이터 갯수
    */
   public Pagination(int currentPage, int totalRows) {
      this(currentPage, totalRows, 10, 5);
   }
   
   /**
    * 요청한 페이지번호, 전체 데이터 갯수, 한 화면에 표시할 행의 갯수를 전달받아서 Pagination객체를 초기화한다.
    * <p>한 화면에 표시되는 페이지번호 갯수는 5개다.
    * @param currentPage 요청한 페이지 번호
    * @param totalRows 전체 데이터 갯수
    * @param rows 한 화면에 표시되는 행의 갯수
    */
   public Pagination(int currentPage, int totalRows, int rows) {
      this(currentPage, totalRows, rows, 5);
      
   }
   
   /**
    * 요청한 페이지번호, 전체 데이터 갯수, 한 화면에 표시할 행의 갯수, 한 화면에 표시할 페이지번호 갯수를 전달받아서 Pagination객체를 초기화한다.
    * @param currentPage 요청한 페이지 번호
    * @param totalRows 전체 데이터 갯수
    * @param rows 한 화면에 표시되는 행의 갯수
    * @param pages 한 화면에 표시되는 페이지번호 갯수
    */
   public Pagination(int currentPage, int totalRows, int rows, int pages) {
      this.currentPage = currentPage;
      this.totalRows = totalRows;
      this.rows = rows;
      this.pages = pages;
   }
   
   public int getPage() {
	   return currentPage;
   }
   
   /**
    * 요청한 페이지번호의 조회 시작번호를 반환한다.
    * @return
    */
   public int getBegin() {
      return (currentPage - 1)*rows + 1;
   }
   /**
    * 요청한 페이지번호의 조회 끝번호를 반환한다.
    * @return
    */
   public int getEnd() {
      return currentPage*rows;
   }
   /**
    * 총 페이지 갯수를 반환한다.
    * @return
    */
   public int getTotalPages() {
      return (int) Math.ceil((double) totalRows/rows);
   }
   /**
    * 총 페이지 블록 갯수를 반환한다.
    * @return
    */
   public int getTotalBlocks() {
      return (int) Math.ceil((double) getTotalPages()/pages);
   }
   /**
    * 요청한 페이지번호가 속한 페이지 블록 번호를 반환한다.
    * @return
    */
   public int getCurrentPageBlock() {
      return (int) Math.ceil((double) currentPage/pages);
   }
   /**
    * 요청한 페이지번호가 속한 페이지 블록의 시작 페이지 번호를 반환한다.
    * @return
    */
   public int getBeginPage() {
      return (getCurrentPageBlock() - 1)*pages + 1;
   }
   /**
    * 요청한 페이지번호가 속한 페이지 블록의 끝 페이지 번호를 반환한다.
    * @return
    */
   public int getEndPage() {
      return getCurrentPageBlock() == getTotalBlocks() ? getTotalPages() : getCurrentPageBlock()*pages;
   }
   /**
    * 첫 페이지인지 여부를 반환한다.
    * @return 첫 페이지이면 true를 반환한다.
    */
   public boolean isFirst() {
      return currentPage <= 1;
   }
   /**
    * 끝 페이지인지 여부를 반환한다.
    * @return 끝 페이지이면 true를 반환한다.
    */
   public boolean isLast() {
      return currentPage >= getTotalPages();
   }
   /**
    * 이전 페이지 번호를 반환한다.
    * @return
    */
   public int getPrevPage() {
      return currentPage - 1;
   }
   /**
    * 다음 페이지번호를 반환한다.
    * @return
    */
   public int getNextPage() {
      return currentPage + 1;
   }
}